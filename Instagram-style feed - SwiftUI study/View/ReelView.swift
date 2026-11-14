//
//  ReelView.swift
//  Instagram-style feed - SwiftUI study
//
//  Created by Abiu Isai Ramirez Roldan on 09/11/26.
//

import SwiftUI

struct ReelView: View {
    var body: some View {
        ReelDetailsView()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .padding(16)
            .background(alignment: .bottom) {
                Image("natural_cliffs")
                    .resizable()
                    .scaledToFill()
                    .overlay(alignment: .bottom) {
                        LinearGradient(colors: [.clear, .black.opacity(0.6)], startPoint: .top, endPoint: .bottom)
                            .frame(height: 300)
                    }
                    .ignoresSafeArea()
            }
    }

    func ReelDetailsView() -> some View {
        HStack(alignment: .bottom, spacing: 10) {
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 10) {
                    Image(systemName: "person.circle.fill")
                        .font(.largeTitle)

                    Text("Author's name")
                        .font(.callout)
                        .fontWeight(.bold)
                        .lineLimit(1)
                }
                .foregroundStyle(.white)

                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry")
                    .font(.body)
                    .foregroundStyle(.white)
                    .lineLimit(1)
            }

            Spacer(minLength: 0)

            VStack(spacing: 35) {
                Button("Like", systemImage: "suit.heart.fill") {
                    
                }
                .labelStyle(.iconOnly)
                .foregroundStyle(.red)

                Button("Comments", systemImage: "message") {
                    
                }
                .labelStyle(.iconOnly)
                
                Button("Message", systemImage: "paperplane") {
                    
                }
                .labelStyle(.iconOnly)
                
                Button("More", systemImage: "ellipsis") {
                    
                }
                .labelStyle(.iconOnly)
            }
            .font(.title2)
            .foregroundStyle(.white)
        }
        .padding(.leading, 15)
        .padding(.trailing, 10)
    }
}

#Preview {
    ReelView()
}
