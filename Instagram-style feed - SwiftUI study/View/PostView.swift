//
//  PostView.swift
//  Instagram-style feed - SwiftUI study
//
//  Created by Abiú Ramírez Roldán on 24/10/26.
//

import SwiftUI

struct PostView: View {
    @Binding var post: Post
    
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
                    .contentShape(Rectangle())
                    .onTapGesture(count: 2) {
                        post.engagement.like()
                    }
            }
            
            actionBar
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
    
    private var actionBar: some View {
        HStack {
            
            Button {
                post.engagement.toggleLike()
            } label: {
                Label {
                    Text(post.engagement.likesCount, format: .number.notation(.compactName))
                } icon: {
                    Image(systemName: "heart")
                        .environment(\.symbolVariants, post.engagement.isLiked ?  .fill : .none)
                        .foregroundStyle(post.engagement.isLiked ? .red : .primary)
                        .symbolEffect(.bounce, value: post.engagement.isLiked)
                }
            }
            .accessibilityLabel("Like")
            .accessibilityValue("\(post.engagement.likesCount)")
            .accessibilityAddTraits(post.engagement.isLiked ? .isSelected : [])
            

            Button {
                
            } label: {
                Label(post.engagement.commentsCount.formatted(.number.notation(.compactName)), systemImage: "message")
                    .accessibilityLabel("Comments")
            }
            
            Button {
                
            } label: {
                Label(post.engagement.repostsCount.formatted(.number.notation(.compactName)), systemImage: "repeat")
            }
            
            Button {
                
            } label: {
                Label(post.engagement.sharesCount.formatted(.number.notation(.compactName)), systemImage: "paperplane")
            }

            Spacer()

            Image(systemName: "bookmark")
        }
        .tint(.primary)
        .padding(.vertical, 4)
        .padding(.horizontal, 8)
    }
}

#Preview("Chasing Waterfall") {
    @Previewable @State var post = Post(
        image: "chasing_waterfall",
        author: User(
            username: "Apple",
            displayName: "codingwithparvez",
            avatar: "BrooklynBridge"
        ),
        subtitle: "Ad",
        engagement: .init(
            isLiked: false,
            likesCount: 999,
            commentsCount: 120,
            repostsCount: 93,
            sharesCount: 9
        )
    )
    
    PostView(
        post: $post
    )
    .onAppBackground()
}

#Preview("BrooklynBridge") {
    PostView(
        post: .constant(
            Post(
                image: "BrooklynBridge",
                author: User(
                    username: "Apple",
                    displayName: "codingwithparvez",
                    avatar: "BrooklynBridge"
                ),
                subtitle: "Ad",
                engagement: .init(
                    isLiked: false,
                    likesCount: 49483,
                    commentsCount: 2,
                    repostsCount: 32,
                    sharesCount: 43
                )
            )
        )
    )
    .onAppBackground()
}
