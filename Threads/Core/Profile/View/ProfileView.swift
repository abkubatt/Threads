//
//  ProfileView.swift
//  Threads
//
//  Created by Abdulmajit Kubatbekov on 7/2/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    @StateObject var viewModel = ProfileViewModel()
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    
    private var currentUser: User? {
        return viewModel.currentUser
    }

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                // bio and status
                VStack(spacing: 20) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 12) {
                            // fullname and username
                            VStack(alignment: .leading, spacing: 4) {
                                Text(currentUser?.fullname ?? "")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                
                                Text(currentUser?.username ?? "")
                                    .font(.subheadline)
                            }
                            
                            if let bio = currentUser?.bio {
                                Text(bio)
                                    .font(.footnote)
                            }
                            
                            Text("78 followers")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        CircularProfileImageView()
                    }
                    
                    Button {

                    } label: {
                        Text("Follow")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 352, height: 32)
                            .background(.black)
                            .cornerRadius(8)
                    }
                    
                    // user content list view
                    VStack {
                        HStack {
                            ForEach(ProfileThreadFilter.allCases) { filter in
                                VStack {
                                    Text(filter.title)
                                        .font(.subheadline)
                                        .fontWeight(selectedFilter == filter ? .semibold : .regular)
                                    if selectedFilter == filter {
                                        Rectangle()
                                            .foregroundColor(.black)
                                            .frame(width: filterBarWidth, height: 1)
                                            .matchedGeometryEffect(id: "item", in: animation)
                                    } else {
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: filterBarWidth, height: 1)
                                    }
                                }
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        selectedFilter = filter
                                    }
                                }
                            }
                        }
                        
                        LazyVStack {
                            ForEach(0 ... 10, id: \.self) { thread in
                                FeedViewThreadCell()
                            }
                        }
                    }
                    .padding(.vertical, 8)
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
}

#Preview {
    ProfileView()
}
