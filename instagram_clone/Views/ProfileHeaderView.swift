//
//  ProfileHeaderView.swift
//  instagram_clone
//
//  Created by apprikart on 24/02/26.
//
import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Image(user.profileImageUrl ?? "person.circle")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .background(Circle().fill(Color.gray.opacity(0.3)))
                
                Spacer()
                
                HStack(spacing: 24) {
                    UserStatView(value: "3", title: "Posts")
                    UserStatView(value: "1.2M", title: "Followers")
                    UserStatView(value: "14", title: "Following")
                }
            }
            .padding(.horizontal)
            VStack(alignment: .leading, spacing: 4) {
                if let fullName = user.fullName {
                    Text(fullName)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                Text("Building the iOS journey. 💻📱")
                    .font(.footnote)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            // Bottom Row: Action Buttons
            HStack {
                Button(action: {}) {
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .foregroundColor(.primary)
                        .background(RoundedRectangle(cornerRadius: 6).stroke(Color.gray, lineWidth: 1))
                }
                
                Button(action: {}) {
                    Text("Share Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .foregroundColor(.primary)
                        .background(RoundedRectangle(cornerRadius: 6).stroke(Color.gray, lineWidth: 1))
                }
            }
            .padding(.horizontal)
        }
    }
}
struct UserStatView: View {
    let value: String
    let title: String
    
    var body: some View {
        VStack {
            Text(value)
                .font(.subheadline)
                .fontWeight(.semibold)
            Text(title)
                .font(.caption)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.MOCK_USERS[0])
    }
}
