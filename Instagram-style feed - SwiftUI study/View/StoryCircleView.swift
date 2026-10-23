//
//  StoryCircleView.swift
//  Instagram-style feed - SwiftUI study
//
//  Created by Abiu Ramirez on 22/10/26.
//

import SwiftUI

struct StoryCircleView: View {
    private let seen: Bool
    private let image: String
    private let username: String
    private var ringStyle: AnyShapeStyle {
        seen ? AnyShapeStyle(.gray.opacity(0.3)) : AnyShapeStyle(
            storyGradient
        )
    }

    private let storyGradient = LinearGradient(
        colors: [
            .yellow,
            .orange,
            .pink,
            .purple
        ],
        startPoint: .bottomLeading,
        endPoint: .topTrailing
    )
    
    init(seen: Bool,
         image: String,
         username: String
    ) {
        self.seen = seen
        self.image = image
        self.username = username
    }
    
    var body: some View {
        VStack(spacing: 8) {
            GeometryReader { proxy in
                let layout = StoryCircleSizeConfiguration(size: proxy.size.height)
                ZStack {
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: layout.imageDiameter, height: layout.imageDiameter)
                        .clipShape(Circle())

                    Circle()
                        .strokeBorder(
                            ringStyle,
                            lineWidth: layout.ringWidth
                        )
                }
            }
            .aspectRatio(1, contentMode: .fit)

            Text(username)
                .font(.caption)
                .lineLimit(1)
                .textCase(.lowercase)
        }
    }
}

#Preview {
    StoryCircleView(seen: false, image: "BrooklynBridge", username: "Apple")
}
//
//#Preview("Medium") {
//    
//    // give an specific size in the init
//    StoryCircleView(seen: true, image: "BrooklynBridge", username: "Apple", size: 150)
//}
//
//#Preview("Larga") {
//    
//    // give an specific size in the init
//    StoryCircleView(seen: false, image: "BrooklynBridge", username: "Apple", size: 300)
//}
