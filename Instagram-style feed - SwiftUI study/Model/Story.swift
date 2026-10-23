//
//  Story.swift
//  Instagram-style feed - SwiftUI study
//
//  Created by Abiú Ramírez Roldán on 23/10/26.
//

import Foundation

struct Story: Identifiable {
    let id = UUID()
    let seen: Bool
    let image: String
    let username: String
}

// MARK: - Mock list
extension Story {
    static let stories: [Story] = [
        Story(seen: false, image: "BrooklynBridge", username: "Apple"),
        Story(seen: true, image: "chasing_waterfall", username: "appleengineeringteam"),
        Story(seen: false, image: "natural_cliffs", username: "Meta"),
        Story(seen: true, image: "vintage_car", username: "Amazon"),
        Story(seen: false, image: "", username: "Samsung"),
        Story(seen: true, image: "", username: "Mac"),
        Story(seen: false, image: "", username: "iPhone"),
        Story(seen: true, image: "", username: "iPad")
    ]
}
