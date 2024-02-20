//
//  ProfileViewModel.swift
//  Threads
//
//  Created by Abdulmajit Kubatbekov on 17/2/24.
//

import Foundation
import Combine
import PhotosUI
import SwiftUI

final class CurrentUserProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var selectedItem: PhotosPickerItem? {
        didSet {
            Task { await loadImage() }
        }
    }
    @Published var profileImage: Image?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setSubscribers()
    }
    
    private func setSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
            print("user from combine: \(String(describing: user))")
        }
        .store(in: &cancellables)
    }
    
    private func loadImage() async {
        guard let item = selectedItem else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.profileImage = Image(uiImage: uiImage)
    }
}
