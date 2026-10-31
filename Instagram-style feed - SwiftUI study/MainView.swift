//
//  MainView.swift
//  Instagram-style feed - SwiftUI study
//
//  Created by Abiu Ramirez on 22/10/26.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab: AppTab = .feed
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab(value: .feed) {
                FeedView()
                    .onAppBackground()
            } label: {
                Image(selectedTab == .feed ? .feedSelected : .feed)
                    .accessibilityLabel("Home")
            }

            Tab(value: .reels) {
                Placeholder(placeholderText: "Reels")
            } label: {
                Image(selectedTab == .reels ? .reelsSelected : .reels)
                    .accessibilityLabel("Reels")
            }

            Tab(value: .messages) {
                Placeholder(placeholderText: "Messages")
            } label: {
                Image(selectedTab == .messages ? .messagesSelected : .messages)
                    .accessibilityLabel("Messages")
            }

            Tab(value: .search) {
                Placeholder(placeholderText: "Search")
            } label: {
                Image(selectedTab == .search ? .searchSelected : .search)
                    .accessibilityLabel("Search")
            }
            
            Tab(value: .profile) {
                Placeholder(placeholderText: "Profile")
            } label: {
                Image(selectedTab == .profile ? .profileSelected : .profile)
                    .accessibilityLabel("Profile")
            }
        }
//        .tabViewStyle(.sidebarAdaptable)
//        .tabBarMinimizeBehavior(.onScrollDown)
        .tint(.primary)
    }
}

#Preview {
    MainView()
}
