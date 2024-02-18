//
//  CurrentUserProfile.swift
//  Threads
//
//  Created by Abdulmajit Kubatbekov on 18/2/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @StateObject var viewModel = CurrentUserProfileViewModel()
    
    private var currentUser: User {
        return viewModel.currentUser
    }

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                // bio and starts
                ProfileHeaderView(user: currentUser)
                
                Button {
                    
                } label: {
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .frame(width: 352, height: 32)
                        .background(Color(.white))
                        .cornerRadius(8)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(.systemGray4), lineWidth: 1)
                        }
                }
                
                // user content list view
                UserContentListView()
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    AuthService.shared.singOut()
                } label: {
                    Image(systemName: "arrow.left")
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    CurrentUserProfileView()
}
