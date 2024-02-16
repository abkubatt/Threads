//
//  ContentViewModel.swift
//  Threads
//
//  Created by Abdulmajit Kubatbekov on 16/2/24.
//

import Firebase
import Combine
import Foundation

class ContentViewModel: ObservableObject {
    @Published var userSession: Firebase.User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscibers()
    }
    
    private func setupSubscibers() {
        AuthService.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
    }
}
