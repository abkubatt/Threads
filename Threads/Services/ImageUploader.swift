//
//  ImageUploader.swift
//  Threads
//
//  Created by Abdulmajit Kubatbekov on 22/2/24.
//

import SwiftUI
import FirebaseStorage
import Firebase

struct ImageUploader {
    
    static func loadImage(_ image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else { return nil }
        let fileName = NSUUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        
        do {
            let _ = try await storageRef.putDataAsync(imageData)
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        } catch {
            print("error whilte image uploading: \(error)")
            return nil
        }
    }
}
