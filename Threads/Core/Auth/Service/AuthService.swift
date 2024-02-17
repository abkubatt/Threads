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
            try await uploadUserData(withEmail: withEmail,
                                     password: password,
                                     fullName: fullName,
                                     username: username,
                                     id: result.user.uid)
            print("Created user: \(result.user.uid)")
        } catch {
            print("error: \(error.localizedDescription)")
        }
    }
    
    func singOut() {
        try? Auth.auth().signOut()
        userSession = nil
    }
    
    @MainActor
    private func uploadUserData(
        withEmail: String,
        password: String,
        fullName: String,
        username: String,
        id: String
    ) async throws {
        let user = User(id: id, 
                        email: withEmail,
                        password: password,
                        fullname: fullName,
                        username: username)
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
    }
}
