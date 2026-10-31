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
    var engagement: PostEngagement
    
    static let maxPortraitRatio = 0.8
    static let maxLandscapeRatio = 1.91
    
    init(id: UUID = UUID(), image: String, author: User, subtitle: String? = nil, engagement: PostEngagement) {
        self.id = id
        self.image = image
        self.author = author
        self.subtitle = subtitle
        self.engagement = engagement
    }
}

struct PostEngagement: Hashable {
    private(set) var isLiked: Bool = false
    private(set) var likesCount: Int = 0
    var commentsCount: Int = 0
    var repostsCount: Int = 0
    var sharesCount: Int = 0
    
    mutating func toggleLike() {
        isLiked.toggle()

        likesCount += isLiked ? 1 : -1
    }
    
    mutating func like() {
        guard !isLiked else { return }
        toggleLike()
    }
}

extension Post {
    static let mock: [Self] = [
        .init(
            image: "layout_sea",
            author: User(
                username: "Apple",
                displayName: "Apple",
                avatar: "layout_sea"
            ),
            engagement: .init(
                isLiked: false,
                likesCount: 293,
                commentsCount: 93,
                repostsCount: 2,
                sharesCount: 9
            )
        ),
        .init(
            image: "natural_cliffs",
            author: User(
                username: "Microsoft",
                displayName: "Micro",
                avatar: "natural_cliffs"),
            engagement: .init(
                isLiked: false,
                likesCount: 3929238,
                commentsCount: 23,
                repostsCount: 90,
                sharesCount: 5
            )
        ),
        .init(
            image: "vintage_car",
            author: User(
                username: "Tesla",
                displayName: "Tesla",
                avatar: "vintage_car"),
            engagement: .init(
                isLiked: false,
                likesCount: 999,
                commentsCount: 12,
                repostsCount: 12,
                sharesCount: 94
            )
        ),
        .init(
            image: "plant",
            author: User(
                username: "Github",
                displayName: "Github",
                avatar: "plant"),
            engagement: .init(
                isLiked: false,
                likesCount: 54,
                commentsCount: 23,
                repostsCount: 65,
                sharesCount: 58
            )
        )
    ]
}
