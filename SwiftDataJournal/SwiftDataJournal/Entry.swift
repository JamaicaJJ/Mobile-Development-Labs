//
//  Entry.swift
//  SwiftDataJournal
//
//  Created by David Santiago Jamaica Galvis on 6/13/25.
//

import Foundation
import SwiftData

@Model
final class Entry {
    var id: String
    var title: String
    var body: String
    var createdAt: Date
    var updatedAt: Date?

    // Optional journal reference (inverse side of the relationship)
    var journal: Journal?

    init(
        id: String = UUID().uuidString,
        title: String,
        body: String,
        createdAt: Date = Date(),
        updatedAt: Date? = nil,
        journal: Journal? = nil
    ) {
        self.id = id
        self.title = title
        self.body = body
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.journal = journal
    }
}


