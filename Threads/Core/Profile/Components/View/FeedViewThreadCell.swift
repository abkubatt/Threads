//
//  FeedViewThreadCell.swift
//  Threads
//
//  Created by Abdulmajit Kubatbekov on 8/2/24.
//

import SwiftUI

struct FeedViewThreadCell: View {
    var thread: Thread

    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                CircularProfileImageView(user: thread.user, size: .medium)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(thread.user?.username ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text(thread.timestamp.timestampString())
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3))
                        
                        Button {
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.darkGray))
                        }
                    }
                    
                    Text(thread.caption)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 16) {
                        Button {
                        } label: {
                            Image(systemName: "heart")
                        }
                        
                        Button {
                        } label: {
                            Image(systemName: "bubble.right")
                        }
                        
                        Button {
                        } label: {
                            Image(systemName: "arrow.rectanglepath")
                        }
                        
                        Button {
                        } label: {
                            Image(systemName: "paperplane")
                        }
                    }
                    .foregroundColor(.black)
                    .padding(.vertical, 8)
                }
            }
            Divider()
        }
        .padding()
    }
}

#Preview {
    FeedViewThreadCell(thread: DeveloperPreview.thread)
}
