//
//  ContentView.swift
//  SwiftDataJournal
//
//  Created by David Santiago Jamaica Galvis on 6/13/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var journals: [Journal]
    
    @State private var showingAddJournal = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(journals) { journal in
                    NavigationLink(destination: EntriesView(journal: journal)) {
                        VStack(alignment: .leading) {
                            Text(journal.title).font(.headline)
                            Text("\(journal.entries.count) entries").font(.subheadline).foregroundColor(.gray)
                        }
                    }
                }
                .onDelete(perform: deleteJournals)
            }
            .navigationTitle("Journals")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddJournal = true
                    } label: {
                        Label("Add Journal", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddJournal) {
                AddJournalView()
            }
        }
    }

    private func deleteJournals(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(journals[index])
        }
        try? modelContext.save()
    }
}



#Preview {
    ContentView()
}
