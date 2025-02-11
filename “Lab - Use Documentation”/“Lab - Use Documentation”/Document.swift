//
//  Document.swift
//  “Lab - Use Documentation”
//
//  Created by David Santiago Jamaica Galvis on 2/8/25.
//

import UIKit

class Document: UIDocument {
    
    override func contents(forType typeName: String) throws -> Any {
        // Encode your document with an instance of NSData or NSFileWrapper
        return Data()
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        // Load your document from contents
    }
}

///1. 
