//
//  RegistrationViewModel.swift
//  Threads
//
//  Created by Abdulmajit Kubatbekov on 15/2/24.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullName = ""
    @Published var username = ""
    
    @MainActor
    func createUser() async throws {
        try await AuthService.shared.createUser(
            withEmail: email,
            password: password,
            fullName: fullName,
            username: username
        )
    }
}
