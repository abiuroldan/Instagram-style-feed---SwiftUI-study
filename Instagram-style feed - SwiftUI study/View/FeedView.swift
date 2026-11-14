//
//  FeedView.swift
//  Instagram-style feed - SwiftUI study
//
//  Created by Abiu Ramirez on 22/10/26.
//

import SwiftUI

struct FeedView: View {
    let stories = UserStories.mock
    @State private var posts = Post.mock
    
    var body: some View {
        VStack {
            ScrollView {
                topHeader

//            Text("This is a very long string that might get truncated by its parent view.")
//                .frame(maxHeight: .infinity)
//                .padding(.horizontal)
                LazyVStack {
                    ForEach($posts) { $post in
                        PostView(post: $post)
                    }
                    .padding(.top)
                }
            }
            .scrollIndicators(.hidden)
        }
    }
    
    private var topHeader: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 12) {
                ForEach(stories) { item in
                    StoryCircleView(user: item.user, ring: item.ring)
//                        .containerRelativeFrame(.horizontal) { len, _ in
//                            len / 4
//                        }
                        .containerRelativeFrame(.horizontal, count: 9, span: 2, spacing: 12)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    FeedView()
        .onAppBackground()
}
