//
//  User.swift
//  Instagram-style feed - SwiftUI study
//
//  Created by Abiú Ramírez Roldán on 24/10/26.
//

import Foundation

struct User: Identifiable, Hashable {
    let id: UUID
    let username: String
    let displayName: String
    let avatar: String
    
    init(id: UUID = UUID(), username: String, displayName: String, avatar: String) {
        self.id = id
        self.username = username
        self.displayName = displayName
        self.avatar = avatar
    }
}
