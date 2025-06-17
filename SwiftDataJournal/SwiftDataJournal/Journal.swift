//
//  Journal.swift
//  SwiftDataJournal
//
//  Created by David Santiago Jamaica Galvis on 6/16/25.
//

import Foundation
import SwiftData

@Model
final class Journal {
    var id: String
    var title: String
    var createdAt: Date
    var updatedAt: Date?
    
    @Relationship(deleteRule: .cascade, inverse: \Entry.journal)
    var entries: [Entry] = []

    init(
        id: String = UUID().uuidString,
        title: String,
        createdAt: Date = Date(),
        updatedAt: Date? = nil
    ) {
        self.id = id
        self.title = title
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
