import SwiftUI
import UniformTypeIdentifiers

struct Student: Identifiable, Equatable {
    let id = UUID()
    var firstName: String
    var surname: String
    var className: String
    var targetGrade: String
}

enum CSVError: Error, LocalizedError {
    case invalidData
    case invalidFormat

    var errorDescription: String? {
        switch self {
        case .invalidData: return "The file could not be read as text."
        case .invalidFormat: return "The CSV format is invalid or missing required columns."
        }
    }
}

struct CSV {
    static func parse(data: Data, hasHeader: Bool = true, delimiter: Character = ",") throws -> [[String]] {
        guard let text = String(data: data, encoding: .utf8) ?? String(data: data, encoding: .utf16) else {
            throw CSVError.invalidData
        }
        var rows: [[String]] = []
        var currentField = ""
        var currentRow: [String] = []
        var inQuotes = false
        var iterator = text.makeIterator()

        func endField() {
            currentRow.append(currentField)
            currentField = ""
        }
        func endRow() {
            // Avoid adding a trailing empty row
            if !(currentRow.count == 1 && currentRow.first?.isEmpty == true) {
                rows.append(currentRow)
            }
            currentRow.removeAll(keepingCapacity: true)
        }

        while let ch = iterator.next() {
            if ch == "\"" {
                if inQuotes {
                    if let next = iterator.next() {
                        if next == "\"" {
                            currentField.append("\"")
                        } else if next == delimiter {
                            inQuotes = false
                            endField()
                            continue
                        } else if next == "\n" || next == "\r" {
                            inQuotes = false
                            endField()
                            if next == "\r" { _ = (iterator.next() == "\n") ? () : () }
                            endRow()
                            continue
                        } else {
                            inQuotes = false
                            if next == delimiter {
                                endField()
                            } else if next == "\n" || next == "\r" {
                                endField()
                                if next == "\r" { _ = (iterator.next() == "\n") ? () : () }
                                endRow()
                            } else {
                                currentField.append(next)
                            }
                        }
                    } else {
                        inQuotes = false
                        endField()
                        endRow()
                    }
                } else {
                    inQuotes = true
                }
            } else if ch == delimiter && !inQuotes {
                endField()
            } else if (ch == "\n" || ch == "\r") && !inQuotes {
                endField()
                if ch == "\r" { _ = (iterator.next() == "\n") ? () : () }
                endRow()
            } else {
                currentField.append(ch)
            }
        }

        if !currentField.isEmpty || !currentRow.isEmpty {
            endField()
            endRow()
        }

        if hasHeader, !rows.isEmpty { return Array(rows.dropFirst()) }
        return rows
    }
}

func students(from rows: [[String]]) -> [Student] {
    rows.compactMap { columns in
        guard columns.count >= 4 else { return nil }
        return Student(
            firstName: columns[0].trimmingCharacters(in: .whitespacesAndNewlines),
            surname: columns[1].trimmingCharacters(in: .whitespacesAndNewlines),
            className: columns[2].trimmingCharacters(in: .whitespacesAndNewlines),
            targetGrade: columns[3].trimmingCharacters(in: .whitespacesAndNewlines)
        )
    }
}

#if os(iOS)
struct CSVImporter: UIViewControllerRepresentable {
    var onComplete: (Result<[Student], Error>) -> Void

    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let controller = UIDocumentPickerViewController(forOpeningContentTypes: [UTType.commaSeparatedText, UTType.text, UTType.data])
        controller.allowsMultipleSelection = false
        controller.delegate = context.coordinator
        return controller
    }

    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {}

    func makeCoordinator() -> Coordinator { Coordinator(onComplete: onComplete) }

    final class Coordinator: NSObject, UIDocumentPickerDelegate {
        let onComplete: (Result<[Student], Error>) -> Void
        init(onComplete: @escaping (Result<[Student], Error>) -> Void) { self.onComplete = onComplete }

        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            guard let url = urls.first else { return }
            do {
                let shouldStop = url.startAccessingSecurityScopedResource()
                defer { if shouldStop { url.stopAccessingSecurityScopedResource() } }
                let data = try Data(contentsOf: url)
                let rows = try CSV.parse(data: data, hasHeader: true)
                let imported = students(from: rows)
                guard !imported.isEmpty else { throw CSVError.invalidFormat }
                onComplete(.success(imported))
            } catch {
                onComplete(.failure(error))
            }
        }

        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            onComplete(.failure(CSVError.invalidData))
        }
    }
}
#endif
