//
//  ThreadService.swift
//  Threads
//
//  Created by Abdulmajit Kubatbekov on 23/2/24.
//

import Firebase
import FirebaseFirestoreSwift

struct ThreadService {

    static func uploadThread(thread: Thread) async throws {
        guard let threadDate = try? Firestore.Encoder().encode(thread) else { return }
        try await Firestore.firestore().collection("threads").addDocument(data: threadDate)
    }
}
