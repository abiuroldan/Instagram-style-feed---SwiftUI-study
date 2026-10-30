//
//  Post.swift
//  Instagram-style feed - SwiftUI study
//
//  Created by Abiú Ramírez Roldán on 26/10/26.
//

import SwiftUI

struct Post: Identifiable, Hashable {
    let id: UUID
    let image: String
    let author: User
    let subtitle: String?
    
    static let maxPortraitRatio = 0.8
    static let maxLandscapeRatio = 1.91
    
    init(id: UUID = UUID(), image: String, author: User, subtitle: String? = nil) {
        self.id = id
        self.image = image
        self.author = author
        self.subtitle = subtitle
    }
}

extension Post {
    static let mock: [Self] = [
        .init(image: "layout_sea", author: User(username: "Apple", displayName: "Apple", avatar: "layout_sea")),
        .init(image: "natural_cliffs", author: User(username: "Microsoft", displayName: "Micro", avatar: "natural_cliffs")),
        .init(image: "vintage_car", author: User(username: "Tesla", displayName: "Tesla", avatar: "vintage_car"))
    ]
}
