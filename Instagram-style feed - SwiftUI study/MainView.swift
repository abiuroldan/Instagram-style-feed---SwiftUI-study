//
//  MainView.swift
//  Instagram-style feed - SwiftUI study
//
//  Created by Abiu Ramirez on 22/10/26.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }
        }
    }
}

#Preview {
    MainView()
}
