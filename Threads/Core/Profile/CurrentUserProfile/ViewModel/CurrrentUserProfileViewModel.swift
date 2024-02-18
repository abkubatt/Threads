//
//  ProfileViewModel.swift
//  Threads
//
//  Created by Abdulmajit Kubatbekov on 17/2/24.
//

import Foundation
import Combine

final class CurrentUserProfileViewModel: ObservableObject {
    @Published var currentUser: User?
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
}
