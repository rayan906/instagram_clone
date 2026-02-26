//
//  StorySectionView.swift
//  instagram_clone
//
//  Created by apprikart on 24/02/26.
//
import SwiftUI

struct StorySectionView: View {
    let storyGradient = LinearGradient(
        colors: [.yellow, .red, .purple],
        startPoint: .bottomLeading,
        endPoint: .topTrailing
    )
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                VStack {
                    ZStack(alignment: .bottomTrailing) {
                        if let profileImageUrl = User.MOCK_USERS[0].profileImageUrl {
                            Image(profileImageUrl)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 65, height: 65)
                                .clipShape(Circle())
                        } else {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .foregroundColor(.gray)
                                .frame(width: 65, height: 65)
                                .clipShape(Circle())
                        }
                        
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.blue)
                            .background(Circle().fill(Color.white))
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                            .offset(x: 2, y: 2)
                    }
                    
                    Text("Your story")
                        .font(.caption)
                        .foregroundColor(.primary)
                }
                ForEach(User.MOCK_USERS) { user in
                    VStack {
                        Image(user.profileImageUrl ?? "person.circle") // Fallback if image is missing
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .padding(2) // Creates the gap between the image and the ring
                            .background(Circle().stroke(storyGradient, lineWidth: 2))
                        Text(user.username)
                            .font(.caption)
                            .lineLimit(1)
                            .frame(width: 72)
                    }
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical, 8)
    }
}

struct StorySectionView_Previews: PreviewProvider {
    static var previews: some View {
        StorySectionView()
    }
}
