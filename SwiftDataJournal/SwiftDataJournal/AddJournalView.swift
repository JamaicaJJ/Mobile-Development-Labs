//
//  AddJournalView.swift
//  SwiftDataJournal
//
//  Created by David Santiago Jamaica Galvis on 6/16/25.
//

import SwiftUI
import SwiftData

struct AddJournalView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @State private var title = ""

    var body: some View {
        NavigationStack {
            Form {
                TextField("Journal Title", text: $title)
            }
            .navigationTitle("New Journal")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let journal = Journal(title: title)
                        modelContext.insert(journal)
                        try? modelContext.save()
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}
