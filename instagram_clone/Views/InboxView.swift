//
//  InboxView.swift
//  instagram_clone
//
//  Created by apprikart on 24/02/26.
//


import SwiftUI

struct InboxView: View {
    var body: some View {
        List {
            ForEach(User.MOCK_USERS) { user in
                NavigationLink(destination: ChatView(user: user)) {
                    HStack(spacing: 12) {
                        Image(user.profileImageUrl ?? "person.circle")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                            .background(Color.gray.opacity(0.3).clipShape(Circle()))
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.username)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Text("Active 2h ago")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Image(systemName: "camera")
                            .foregroundColor(.gray)
                            .imageScale(.large)
                    }
                    .padding(.vertical, 4)
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle("Direct Messages")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "square.and.pencil")
            }
        }
    }
}

struct InboxView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            InboxView()
        }
    }
}
