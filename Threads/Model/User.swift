//
//  User.swift
//  Threads
//
//  Created by Abdulmajit Kubatbekov on 17/2/24.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    let email: String
    let password: String
    let fullname: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
