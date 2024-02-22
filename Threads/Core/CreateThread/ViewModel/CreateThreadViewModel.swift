//
//  CreateThreadViewModel.swift
//  Threads
//
//  Created by Abdulmajit Kubatbekov on 23/2/24.
//

import Firebase

final class CreateThreadViewModel: ObservableObject {
    
    func uploadThread(caption: String) async throws {
        
        guard let uuid = Auth.auth().currentUser?.uid else { return }
        let thread = Thread(ownerUid: uuid, caption: caption, timestamp: Timestamp(), likes: 0)
        try await ThreadService.uploadThread(thread: thread)
    }
}
