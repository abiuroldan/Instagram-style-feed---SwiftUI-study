//
//  StoryCircleView.swift
//  Instagram-style feed - SwiftUI study
//
//  Created by Abiu Ramirez on 22/10/26.
//

import SwiftUI

struct StoryCircleView: View {
    private let user: User
    private let storyRing: StoryRing
    private var ringStyle: AnyShapeStyle {
        storyRing == .unseen ?  AnyShapeStyle(
            Self.storyGradient
        ) : AnyShapeStyle(Color(uiColor: .systemGray3))
    }

    static let storyGradient = LinearGradient(
        colors: [
            .yellow,
            .orange,
            .pink,
            .purple
        ],
        startPoint: .bottomLeading,
        endPoint: .topTrailing
    )
    
    private var storyImage: Image {
        if let customImage = UIImage(named: user.avatar) {
            return Image(uiImage: customImage)
        }
        return Image(systemName: "person.circle.fill")
    }
    
    private let showUsername: Bool

    init(
        user: User,
        ring: StoryRing,
        showUsername: Bool = true
    ) {
        self.user = user
        self.showUsername = showUsername
        self.storyRing = ring
    }

    var body: some View {
        VStack(spacing: 8) {
            GeometryReader { proxy in
                let layout = StoryCircleSizeConfiguration(size: proxy.size.height)
                ZStack {
                    storyImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: layout.imageDiameter, height: layout.imageDiameter)
                        .foregroundStyle(.secondary)
                        .clipShape(Circle())

                    if storyRing != .none {
                        Circle()
                            .strokeBorder(
                                ringStyle,
                                lineWidth: layout.ringWidth
                            )
                    }
                }
                .frame(width: layout.size, height: layout.size)
            }
            .aspectRatio(1, contentMode: .fit)

            if showUsername {
                Text(user.displayName)
                    .font(.caption)
                    .lineLimit(1)
                    .textCase(.lowercase)
            }
        }
    }
}

#Preview("None") {
    StoryCircleView(
        user: User(username: "Apple", displayName: "Apple", avatar: "BrooklynBridge"),
        ring: .none,
        showUsername: true
    )
    .onAppBackground()
}

#Preview("Unseen") {
    StoryCircleView(
        user: User(username: "Apple", displayName: "Apple", avatar: "BrooklynBridge"),
        ring: .unseen,
        showUsername: true
    )
    .onAppBackground()
}

#Preview("Seen") {
    StoryCircleView(
        user: User(username: "Apple", displayName: "Apple", avatar: "BrooklynBridge"),
        ring: .seen,
        showUsername: true
    )
    .onAppBackground()
}
