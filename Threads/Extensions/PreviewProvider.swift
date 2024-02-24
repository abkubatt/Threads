//
//  PreviewProvider.swift
//  Threads
//
//  Created by Abdulmajit Kubatbekov on 18/2/24.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

final class DeveloperPreview {
    static let shared = DeveloperPreview()

    static let user = User(id: NSUUID().uuidString,
                    email: "abkubatt@gmail.com",
                    password: "Majitmajit",
                    fullname: "Abdulmajit Kubatbekov",
                    username: "abkubatt")
    
    static let thread = Thread(ownerUid: "123", caption: "Test thread", timestamp: Timestamp(), likes: 0)
}
