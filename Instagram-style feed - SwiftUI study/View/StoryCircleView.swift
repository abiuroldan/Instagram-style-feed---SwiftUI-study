//
//  StoryCircleView.swift
//  Instagram-style feed - SwiftUI study
//
//  Created by Abiu Ramirez on 22/10/26.
//

import SwiftUI

struct StoryCircleView: View {
    private let story: Story
    private var ringStyle: AnyShapeStyle {
        story.seen ? AnyShapeStyle(Color(uiColor: .systemGray3)) : AnyShapeStyle(
            Self.storyGradient
        )
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
        if let customImage = UIImage(named: story.image) {
            return Image(uiImage: customImage)
        }
        return Image(systemName: "person.circle.fill")
    }

    init(story: Story) {
        self.story = story
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

                    Circle()
                        .strokeBorder(
                            ringStyle,
                            lineWidth: layout.ringWidth
                        )
                }
            }
            .aspectRatio(1, contentMode: .fit)

            Text(story.username)
                .font(.caption)
                .lineLimit(1)
                .textCase(.lowercase)
        }
    }
}

#Preview {
    StoryCircleView(story: Story(seen: true, image: "BrooklynBridge", username: "Apple"))
}
