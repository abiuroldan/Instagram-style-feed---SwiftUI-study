//
//  PostView.swift
//  Instagram-style feed - SwiftUI study
//
//  Created by Abiú Ramírez Roldán on 24/10/26.
//

import SwiftUI

struct PostView: View {
    private let post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    var body: some View {
        VStack {
            header
            .padding(.horizontal, 6)
            
            if let postImage = UIImage(named: post.image) {
                let customRatio = postImage.size.width / postImage.size.height
                let clampedRatio = min(max(
                    customRatio, Post.maxPortraitRatio
                ), Post.maxLandscapeRatio)
                Color.clear
                    .aspectRatio(
                        clampedRatio,
                        contentMode: .fit
                    )
                    .overlay {
                        Image(uiImage: postImage)
                            .resizable()
                            .scaledToFill()
                    }
                    .clipped()
            }
        }
    }
    
    private var header: some View {
        HStack {
            StoryCircleView(user: post.author, ring: .unseen, showUsername: false)
                .frame(width: 36)
            
            VStack(alignment: .leading) {
                Text(post.author.displayName)
                    .lineLimit(1)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .textCase(.lowercase)
                
                if let subtitle = post.subtitle {
                    Text(subtitle)
                        .font(.subheadline)
                        .fontWeight(.medium)
                }
            }
            
            Spacer()
            Button {
                
            } label: {
                Text("Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 14)
                    .background(.buttonSecondaryBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
            }
            .tint(.primary)
            .buttonBorderShape(.roundedRectangle(radius: 12))
            
            Button {
                
            } label: {
                Image(systemName: "line.3.horizontal.decrease")
            }
            .tint(.primary)
            .fontWeight(.bold)
        }
    }
}

#Preview("Chasing Waterfall") {
    PostView(
        post: Post(image: "chasing_waterfall", author: User(username: "Apple", displayName: "codingwithparvez", avatar: "BrooklynBridge"), subtitle: "Ad")
    )
    .onAppBackground()
}

#Preview("BrooklynBridge") {
    PostView(
        post: Post(image: "BrooklynBridge", author: User(username: "Apple", displayName: "codingwithparvez", avatar: "BrooklynBridge"), subtitle: "Ad")
    )
    .onAppBackground()
}

#Preview("layout_sea") {
    PostView(
        post: Post(image: "layout_sea", author: User(username: "Apple", displayName: "codingwithparvez", avatar: "BrooklynBridge"), subtitle: "Ad")
    )
    .onAppBackground()
}
