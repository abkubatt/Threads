//
//  ExploreViewModel.swift
//  Threads
//
//  Created by Abdulmajit Kubatbekov on 18/2/24.
//

import Foundation

final class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetchUsers() }
    }
    
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
}
