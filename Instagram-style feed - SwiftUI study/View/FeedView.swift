//
//  FeedView.swift
//  Instagram-style feed - SwiftUI study
//
//  Created by Abiu Ramirez on 22/10/26.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHStack{
                    ForEach(0..<7) { _ in
                        StoryCircleView(seen: false, image: "BrooklynBridge", username: "Apple")
                            .containerRelativeFrame(.horizontal) { len, _ in
                                len / 4
                            }
                    }
                }
                .padding()
            }
            .scrollIndicators(.hidden)
            .fixedSize(horizontal: false, vertical: true)
            .background(.gray.opacity(0.2))

            Text("This is a very long string that might get truncated by its parent view.")
                .frame(maxHeight: .infinity)
                .padding(.horizontal)
        }
    }
}

#Preview {
    FeedView()
}
