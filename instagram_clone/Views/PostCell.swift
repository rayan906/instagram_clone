//
//  PostCell.swift
//  instagram_clone
//
//  Created by apprikart on 23/02/26.
//

import SwiftUI

struct PostCell: View {
    let post: Post
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if let profileImageUrl = post.user?.profileImageUrl {
                    Image(profileImageUrl)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 36, height: 36)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 36, height: 36)
                        .foregroundColor(.gray)
                }
                Text(post.user?.username ?? "Unknown")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.horizontal, 8)
            Group {
                if let localImage = post.localImage {
                    Image(uiImage: localImage)
                        .resizable()
                        .scaledToFit()
                } else if let imageUrl = post.imageUrl {
                    Image(imageUrl)
                        .resizable()
                        .scaledToFit()
                }
            }
            .frame(width: UIScreen.main.bounds.width)
            .background(Color.black.opacity(0.9))
            
            HStack(spacing: 16) {
                Image(systemName: "heart")
                Image(systemName: "bubble.right")
                Image(systemName: "paperplane")
                Spacer()
                Image(systemName: "bookmark")
            }
            .padding(.horizontal, 8)
            .padding(.top, 4)
            .foregroundColor(.primary)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("\(post.likes) likes")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text(post.user?.username ?? "Unknown")
                    .fontWeight(.semibold) +
                Text(" \(post.caption)")
            }
            .font(.footnote)
            .padding(.horizontal, 8)
            .padding(.top, 2)
        }
        .padding(.bottom, 8)
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: Post.MOCK_POSTS[0])
    }
}
