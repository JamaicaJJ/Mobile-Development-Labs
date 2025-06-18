//
//  EntriesView.swift
//  SwiftDataJournal
//
//  Created by David Santiago Jamaica Galvis on 6/16/25.
//

import Foundation
import SwiftUI
import SwiftData

struct EntriesView: View {
    @Environment(\.modelContext) private var modelContext

    var journal: Journal
    @State private var showingAddEntry = false

    var body: some View {
        List {
            ForEach(journal.entries) { entry in
                NavigationLink(destination: AddEditEntryView(entry: entry)) {
                    VStack(alignment: .leading) {
                        Text(entry.title)
                        Text(entry.createdAt, style: .date)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
            .onDelete(perform: deleteEntries)
        }
        .navigationTitle(journal.title)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showingAddEntry = true
                } label: {
                    Label("Add Entry", systemImage: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddEntry) {
            AddEditEntryView(journal: journal)
            
        }
    }

    private func deleteEntries(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(journal.entries[index])
        }
        journal.updatedAt = Date()
        try? modelContext.save()
    }
}
