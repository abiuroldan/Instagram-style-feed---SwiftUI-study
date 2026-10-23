//
//  StoryCircleSizeConfiguration.swift
//  Instagram-style feed - SwiftUI study
//
//  Created by Abiu Ramirez on 22/10/26.
//

import Foundation

struct StoryCircleSizeConfiguration {
    let size: CGFloat
    let ringWidth: CGFloat
    let gapWidth: CGFloat
    let imageDiameter: CGFloat
    
    init(size: CGFloat) {
        self.size = size
        self.ringWidth = size * 0.04
        self.gapWidth = size * 0.03
        self.imageDiameter = size - 2 * (ringWidth + gapWidth)
    }
}
