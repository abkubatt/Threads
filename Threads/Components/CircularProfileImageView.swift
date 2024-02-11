//
//  CircularProfileImageView.swift
//  Threads
//
//  Created by Abdulmajit Kubatbekov on 11/2/24.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        Image("me")
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}

#Preview {
    CircularProfileImageView()
}
