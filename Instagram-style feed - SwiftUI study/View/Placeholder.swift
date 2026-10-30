//
//  Placeholder.swift
//  Instagram-style feed - SwiftUI study
//
//  Created by Abiú Ramírez Roldán on 30/10/26.
//

import SwiftUI

struct Placeholder: View {
    let placeholderText: String
    
    var body: some View {
        Text(placeholderText)
            .onAppBackground()
    }
}

#Preview {
    Placeholder(placeholderText: "placeholder")
}
