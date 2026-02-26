//
//  ProfileView.swift
//  instagram_clone
//
//  Created by apprikart on 24/02/26.

import SwiftUI

struct ProfileView: View {
    let user: User
    @State private var userPosts: [Post] = []
    let gridColumns: [GridItem] = [
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1)
    ]
    let imageDimension = (UIScreen.main.bounds.width / 3) - 1
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    ProfileHeaderView(user: user)
                        .padding(.top, 8)
                    LazyVGrid(columns: gridColumns, spacing: 1) {
                        ForEach(userPosts) { post in
                            NavigationLink(destination: ScrollView { PostCell(post: post) }) {
                                Group {
                                    if let localImage = post.localImage {
                                        Image(uiImage: localImage)
                                            .resizable()
                                            .scaledToFill()
                                    } else if let imageUrl = post.imageUrl {
                                        Image(imageUrl)
                                            .resizable()
                                            .scaledToFill()
                                    }
                                }
                                .frame(width: imageDimension, height: imageDimension)
                                .clipped()
                                .background(Color.gray.opacity(0.3))
                            }
                        }
                    }
                }
            }
            .navigationTitle(user.username)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        Image(systemName: "plus.app")
                        Image(systemName: "line.3.horizontal")
                    }
                    .foregroundColor(.primary)
                }
            }
            .onAppear {
                userPosts = Post.MOCK_POSTS.filter { $0.ownerUid == user.id }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USERS[0])
    }
}
