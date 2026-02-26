//
//  ChatView.swift
//  instagram_clone
//
//  Created by apprikart on 24/02/26.
//
import SwiftUI

struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isFromCurrentUser: Bool
}

struct ChatView: View {
    let user: User
    @State private var messageText = ""
    @State private var messages: [ChatMessage] = [
        ChatMessage(text: "Hey! How is the project going?", isFromCurrentUser: false),
        ChatMessage(text: "Almost done with the DM section! 🚀", isFromCurrentUser: true)
    ]
    
    var body: some View {
        VStack {
            ScrollView {
                ScrollViewReader { proxy in
                    VStack(spacing: 16) {
                        Text("Today 10:42 AM")
                            .font(.caption2)
                            .foregroundColor(.gray)
                            .padding(.top)
                        
                        ForEach(messages) { message in
                            Group {
                                if message.isFromCurrentUser {
                                    HStack {
                                        Spacer()
                                        Text(message.text)
                                            .padding(12)
                                            .background(Color.blue)
                                            .clipShape(RoundedRectangle(cornerRadius: 16))
                                            .foregroundColor(.white)
                                    }
                                    .padding(.horizontal)
                                } else {
                                    HStack(alignment: .bottom) {
                                        Image(user.profileImageUrl ?? "person.circle")
                                            .resizable()
                                            .frame(width: 28, height: 28)
                                            .clipShape(Circle())
                                            .background(Color.gray.opacity(0.3).clipShape(Circle()))
                                        
                                        Text(message.text)
                                            .padding(12)
                                            .background(Color(UIColor.systemGray5))
                                            .clipShape(RoundedRectangle(cornerRadius: 16))
                                            .foregroundColor(.primary)
                                        
                                        Spacer()
                                    }
                                    .padding(.horizontal)
                                }
                            }
                            .id(message.id)
                        }
                    }
                    .onChange(of: messages.count) { _ in
                        if let lastMessageId = messages.last?.id {
                            withAnimation(.easeOut(duration: 0.3)) {
                                proxy.scrollTo(lastMessageId, anchor: .bottom)
                            }
                        }
                    }
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
                                let newMessage = ChatMessage(text: messageText, isFromCurrentUser: true)
                                messages.append(newMessage)
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
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack(spacing: 16) {
                    Image(systemName: "phone")
                    Image(systemName: "video")
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
