//
//  Post.swift
//  instagram_clone
//
//  Created by apprikart on 23/02/26.
//
import Foundation

struct Post: Identifiable, Hashable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Date
    let user: User?
    
    static var MOCK_POSTS: [Post] = [
        .init(
            id: UUID().uuidString,
            ownerUid: User.MOCK_USERS[0].id,
            caption: "Finally finishing up my SwiftUI project! 🚀",
            likes: 104,
            imageUrl: "post1",
            timestamp: Date(),
            user: User.MOCK_USERS[0]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: User.MOCK_USERS[1].id,
            caption: "Design is not just what it looks like and feels like. Design is how it works.",
            likes: 342,
            imageUrl: "post2",
            timestamp: Date(),
            user: User.MOCK_USERS[1]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: User.MOCK_USERS[2].id,
            caption: "Hair force one reporting for duty. ✈️",
            likes: 890,
            imageUrl: "post3",
            timestamp: Date(),
            user: User.MOCK_USERS[2]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: User.MOCK_USERS[3].id,
            caption: "Hair force one reporting for duty. ✈️",
            likes: 890,
            imageUrl: "user1",
            timestamp: Date(),
            user: User.MOCK_USERS[3]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: User.MOCK_USERS[4].id,
            caption: "Hair force one reporting for duty. ✈️",
            likes: 890,
            imageUrl: "user3",
            timestamp: Date(),
            user: User.MOCK_USERS[4]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: User.MOCK_USERS[5].id,
            caption: "Hair force one reporting for duty. ✈️",
            likes: 890,
            imageUrl: "post1",
            timestamp: Date(),
            user: User.MOCK_USERS[5]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: User.MOCK_USERS[6].id,
            caption: "Hair force one reporting for duty. ✈️",
            likes: 890,
            imageUrl: "user2",
            timestamp: Date(),
            user: User.MOCK_USERS[6]
        )
    ]
}
