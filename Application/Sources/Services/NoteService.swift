import Foundation

final class NoteService {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    func loadNotes() throws -> [Note] {
        guard let data = UserDefaults.standard.data(forKey: "notes") else { return [] }
        return try decoder.decode(Array<Note>.self, from: data)
    }

    func save(note: Note) throws {
        var notes = try loadNotes()
        if let index = notes.index(where: { $0.id == note.id }) {
            notes[index] = note
        } else {
            notes.append(note)
        }
        try save(notes: notes)
    }

    private func save(notes: [Note]) throws {
        let data = try encoder.encode(notes)
        UserDefaults.standard.set(data, forKey: "notes")
    }

    func deleteNotes() throws {
        try save(notes: [])
    }
}
