//
//  UserService.swift
//  Threads
//
//  Created by Abdulmajit Kubatbekov on 17/2/24.
//

import Firebase
import FirebaseFirestoreSwift

final class UserService {
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    init() {
        Task { try await fetchCurrentUser() }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uuid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uuid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        print("User is: \(user)")
    }
    
    static func fetchUsers() async throws -> [User] {
        guard let currentUid = Auth.auth().currentUser?.uid else { return [] }
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap { try? $0.data(as: User.self) }
        return users.filter( { $0.id != currentUid })
    }
    
    func reset() {
        currentUser = nil
    }
}
