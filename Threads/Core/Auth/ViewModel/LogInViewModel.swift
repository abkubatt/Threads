//
//  LogInViewModel.swift
//  Threads
//
//  Created by Abdulmajit Kubatbekov on 16/2/24.
//

import Foundation

class LogInViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    @MainActor
    func login() async throws {
        try await AuthService.shared.logIn(withEmail: email, password: password)
    }
}
