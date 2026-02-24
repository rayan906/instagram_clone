//
//  User.swift
//  instagram_clone
//
//  Created by apprikart on 23/02/26.
//

import Foundation

struct User: Identifiable, Hashable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullName: String?
    static var MOCK_USERS: [User] = [
        .init(id: UUID().uuidString, username: "ios_dev_intern", profileImageUrl: "user1", fullName: "Software Engineer"),
        .init(id: UUID().uuidString, username: "steve_jobs", profileImageUrl: "user2", fullName: "Steve Jobs"),
        .init(id: UUID().uuidString, username: "craig_f", profileImageUrl: "user3", fullName: "Craig Federighi"),
        .init(id: UUID().uuidString, username: "craig_f", profileImageUrl: "post1", fullName: "Craig Federighi"),
        .init(id: UUID().uuidString, username: "craig_f", profileImageUrl: "post2", fullName: "Craig Federighi"),
        .init(id: UUID().uuidString, username: "craig_f", profileImageUrl: "post3", fullName: "Craig Federighi"),
        .init(id: UUID().uuidString, username: "craig_f", profileImageUrl: "user1", fullName: "Craig Federighi")
    ]
}
