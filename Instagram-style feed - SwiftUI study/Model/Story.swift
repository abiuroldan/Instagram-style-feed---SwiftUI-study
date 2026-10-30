//
//  Story.swift
//  Instagram-style feed - SwiftUI study
//
//  Created by Abiú Ramírez Roldán on 23/10/26.
//

import Foundation

struct Story: Identifiable, Hashable {
    let id: UUID
    var isSeen: Bool
    let image: String
    let createdAt: Date
    
    init(id: UUID = UUID(), isSeen: Bool = false, image: String, createdAt: Date) {
        self.id = id
        self.isSeen = isSeen
        self.image = image
        self.createdAt = createdAt
    }
}
