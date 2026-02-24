//
//  ChatView.swift
//  instagram_clone
//
//  Created by apprikart on 24/02/26.
//
import SwiftUI

struct ChatView: View {
    let user: User
    @State private var messageText = ""
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 16) {
                    Text("Today 10:42 AM")
                        .font(.caption2)
                        .foregroundColor(.gray)
                        .padding(.top)
                    HStack(alignment: .bottom) {
                        Image(user.profileImageUrl ?? "person.circle")
                            .resizable()
                            .frame(width: 28, height: 28)
                            .clipShape(Circle())
                            .background(Color.gray.opacity(0.3).clipShape(Circle()))
                        
                        Text("Hey! How is the project going?")
                            .padding(12)
                            .background(Color(UIColor.systemGray5))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .foregroundColor(.primary)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    HStack {
                        Spacer()
                        
                        Text("Almost done with the DM section! 🚀")
                            .padding(12)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal)
                }
            }
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(Color(UIColor.systemGray4), lineWidth: 1)
                        .frame(height: 44)
                    
                    HStack {
                        Image(systemName: "camera.fill")
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.blue)
                            .clipShape(Circle())
                            .padding(.leading, 4)
                        
                        TextField("Message...", text: $messageText)
                            .padding(.horizontal, 4)
                        if messageText.isEmpty {
                            Image(systemName: "mic")
                            Image(systemName: "photo")
                            Image(systemName: "sticker")
                        } else {
                            Button("Send") {
                                messageText = ""
                            }
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                        }
                    }
                    .padding(.trailing, 12)
                }
            }
            .padding()
        }
        .navigationTitle(user.username)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            // Audio and Video call icons
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack(spacing: 16) {
                    Image(systemName: "phone")
                    Image(systemName: "video")
                }
            }
            ToolbarItem(placement: .navigationBarLeading) {
                HStack(spacing: 16) {
                    Image(systemName: "arrow.backward")
                }
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChatView(user: User.MOCK_USERS[0])
        }
    }
}
