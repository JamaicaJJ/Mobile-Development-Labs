//
//  AddEditEntryView.swift
//  SwiftDataJournal
//
//  Created by David Santiago Jamaica Galvis on 6/16/25.
//

import SwiftUI
import SwiftData

struct AddEditEntryView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    var entry: Entry?
    var journal: Journal?

    @State private var title: String = ""
    @State private var entryBody: String = ""

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Title")) {
                    TextField("Entry title", text: $title)
                }

                Section(header: Text("Body")) {
                    TextEditor(text: $entryBody)
                        .frame(minHeight: 200)
                }
            }
            .navigationTitle(entry == nil ? "New Entry" : "Edit Entry")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveEntry()
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .onAppear {
                if let entry = entry {
                    title = entry.title
                    entryBody = entry.body
                }
            }
        }
    }

    private func saveEntry() {
        if let entry = entry {
            entry.title = title
            entry.body = entryBody
            entry.updatedAt = Date()
        } else if let journal = journal {
            let newEntry = Entry(title: title, body: entryBody, journal: journal)
            modelContext.insert(newEntry)
            journal.updatedAt = Date()
        }

        try? modelContext.save()
    }
}


