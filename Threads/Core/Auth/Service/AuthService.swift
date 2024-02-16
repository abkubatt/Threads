//
//  AuthService.swift
//  Threads
//
//  Created by Abdulmajit Kubatbekov on 15/2/24.
//

import Firebase

class AuthService {
    
    @Published var userSession: Firebase.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func logIn(withEmail: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: withEmail, password: password)
            self.userSession = result.user
            print("User logged In: \(result.user.uid)")
        } catch {
            print("error: \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail: String,
                    password: String,
                    fullName: String,
                    username: String) async throws {
        
        do {
            let result = try await Auth.auth().createUser(withEmail: withEmail, password: password)
            self.userSession = result.user
            print("Created user: \(result.user.uid)")
        } catch {
            print("error: \(error.localizedDescription)")
        }
    }
    
    func singOut() {
        try? Auth.auth().signOut()
        userSession = nil
    }
}
