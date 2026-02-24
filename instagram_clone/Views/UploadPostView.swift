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
                    // State 2: Image is selected, show preview and caption field
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
                    // State 1: No image selected, show the PhotosPicker
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
                // Cancel button to clear the selection
                ToolbarItem(placement: .navigationBarLeading) {
                    if viewModel.postImage != nil {
                        Button("Cancel") {
                            viewModel.clearPostData()
                            caption = ""
                        }
                        .foregroundColor(.primary)
                    }
                }
                
                // Share button (currently just clears the form, later will save to database)
                ToolbarItem(placement: .navigationBarTrailing) {
                    if viewModel.postImage != nil {
                        Button("Share") {
                            print("Caption to upload: \(caption)")
                            // Reset the view after sharing
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
