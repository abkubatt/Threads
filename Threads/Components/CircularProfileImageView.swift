//
//  CircularProfileImageView.swift
//  Threads
//
//  Created by Abdulmajit Kubatbekov on 11/2/24.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    
    var dimension: CGFloat {
        switch self {
        case .xxSmall:
            return 28
        case .xSmall:
            return 32
        case .small:
            return 40
        case .medium:
            return 48
        case .large:
            return 64
        case .xLarge:
            return 80
        }
    }
}

struct CircularProfileImageView: View {
    var user: User?
    var size: ProfileImageSize

    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .foregroundColor(Color(.systemGray4))
                .frame(width: size.dimension, height: size.dimension)
        }
    }
}

#Preview {
    CircularProfileImageView(user: nil, size: .medium)
}
