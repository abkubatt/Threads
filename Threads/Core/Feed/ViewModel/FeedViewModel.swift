//
//  FeedViewModel.swift
//  Threads
//
//  Created by Abdulmajit Kubatbekov on 24/2/24.
//

import Foundation

@MainActor
final class FeedViewModel: ObservableObject {
    
    @Published var threads = [Thread]()
    
    init() {
        Task { try await fetchThreads() }
    }
    
    func fetchThreads() async throws {
        self.threads = try await ThreadService.fetchThreads()
        try await fetchUsersDataForThreads()
    }
    
    func fetchUsersDataForThreads() async throws {
        for i in 0..<threads.count {
            let thread = threads[i]
            let owneruuid = thread.ownerUid
            let threadUser = try await UserService.fetchUser(withUid: owneruuid)
            threads[i].user = threadUser
        }
    }
}
