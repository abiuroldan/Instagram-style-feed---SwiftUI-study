//
//  View+Extension.swift
//  Instagram-style feed - SwiftUI study
//
//  Created by Abiú Ramírez Roldán on 26/10/26.
//

import SwiftUI

extension View {
    func onAppBackground() -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundPrimary)
    }
}

