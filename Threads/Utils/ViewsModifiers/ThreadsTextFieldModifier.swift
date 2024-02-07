//
//  ThreadsTextFieldModifier.swift
//  Threads
//
//  Created by Abdulmajit Kubatbekov on 7/2/24.
//

import SwiftUI

struct ThreadsTextFieldModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
