//
//  FeedView.swift
//  Threads
//
//  Created by Abdulmajit Kubatbekov on 7/2/24.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.threads) { thread in
                        FeedViewThreadCell(thread: thread)
                    }
                }
            }
            .refreshable {
                print("DEBUG: Refresh threads")
            }
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                } label: {
                    Image(systemName: "arrow.counterclockwise")
                        .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        FeedView()
    }
}
