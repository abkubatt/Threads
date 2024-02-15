//
//  AuthService.swift
//  Threads
//
//  Created by Abdulmajit Kubatbekov on 15/2/24.
//

import Firebase

class AuthService {
    
    static let shared = AuthService()
    
    @MainActor
    func logIn(withEmail: String, password: String) async throws {
        
    }
    
    func createUser(withEmail: String,
                    password: String,
                    fullName: String,
                    username: String) async throws {
        
        do {
            let result = try await Auth.auth().createUser(withEmail: withEmail, password: password)
            print("Created user: \(result.user.uid)")
        } catch {
            print("error: \(error.localizedDescription)")
        }
    }
}
