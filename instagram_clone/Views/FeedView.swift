//
//  FeedView.swift
//  instagram_clone
//
//  Created by apprikart on 24/02/26.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                StorySectionView()
                
                Divider() 
                LazyVStack(spacing: 32) {
                    ForEach(Post.MOCK_POSTS) { post in
                        PostCell(post: post)
                    }
                }
                .padding(.top, 8)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                        Text("Instagram")
                            .font(.title)
                            .fontWeight(.bold)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        Image(systemName: "heart")
                            .imageScale(.large)
                    }
                }
            }
        }
    }
}
struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
