//
//  ContentView.swift
//  Threads
//
//  Created by Abdulmajit Kubatbekov on 6/2/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()

    var body: some View {
        Group {
            if viewModel.userSession != nil {
                ThreadsTabBarView()
            } else {
                LogInView()
            }
        }
    }
}

#Preview {
    ContentView()
}
