//
//  UploadPostView.swift
//  instagram_clone
//
//  Created by apprikart on 24/02/26.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var caption = ""
    @StateObject private var viewModel = UploadPostViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if let image = viewModel.postImage {
                    HStack(alignment: .top) {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipped()
                        
                        TextField("Write a caption...", text: $caption, axis: .vertical)
                            .lineLimit(5)
                    }
                    .padding()
                    
                    Spacer()
                } else {
                    PhotosPicker(selection: $viewModel.selectedImage) {
                        VStack(spacing: 8) {
                            Image(systemName: "photo.on.rectangle.angled")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.primary)
                            
                            Text("Select Photo")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
            }
            .navigationTitle("New Post")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    if viewModel.postImage != nil {
                        Button("Cancel") {
                            viewModel.clearPostData()
                            caption = ""
                        }
                        .foregroundColor(.primary)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    if viewModel.postImage != nil {
                        Button("Share") {
                            let newPost = Post(
                                id: UUID().uuidString,
                                ownerUid: User.MOCK_USERS[0].id,
                                caption: caption,
                                likes: 0,
                                imageUrl: nil,
                                localImage: viewModel.uiImage,
                                timestamp: Date(),
                                user: User.MOCK_USERS[0]
                            )
                            Post.MOCK_POSTS.insert(newPost, at: 0)
                            viewModel.clearPostData()
                            caption = ""
                        }
                        .fontWeight(.semibold)
                    }
                }
            }
        }
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView()
    }
}
