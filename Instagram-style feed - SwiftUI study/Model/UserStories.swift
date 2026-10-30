//
//  UserStories.swift
//  Instagram-style feed - SwiftUI study
//
//  Created by Abiú Ramírez Roldán on 24/10/26.
//

import Foundation

struct UserStories: Identifiable, Hashable {
    let user: User
    var stories: [Story]
    
    var id: User.ID { user.id }
    
    var ring: StoryRing {
        if stories.isEmpty { return .none }
        return stories.allSatisfy(\.isSeen) ? .seen : .unseen
    }
}

enum StoryRing {
    case none, unseen, seen
}

extension UserStories {
    static let mock: [Self] = [
        .init(user: User(username: "Apple", displayName: "appleengineeringteam", avatar: "BrooklynBridge"), stories: [Story(image: "BrooklynBridge", createdAt: .now)]),
        .init(user: User(username: "Meta", displayName: "Meta", avatar: "natural_cliffs"), stories: [Story(image: "natural_cliffs", createdAt: .now)]),
        .init(user: User(username: "Amazon", displayName: "Amazon", avatar: "vintage_car"), stories: [])
    ]
}
    
    
//extension Story {
//    static let stories: [Story] = [
//        Story(seen: false, image: "BrooklynBridge", username: "Apple"),
//        Story(seen: true, image: "chasing_waterfall", username: "appleengineeringteam"),
//        Story(seen: false, image: "natural_cliffs", username: "Meta"),
//        Story(seen: true, image: "vintage_car", username: "Amazon"),
//        Story(seen: false, image: "", username: "Samsung"),
//        Story(seen: true, image: "", username: "Mac"),
//        Story(seen: false, image: "", username: "iPhone"),
//        Story(seen: true, image: "", username: "iPad")
//    ]
//}
