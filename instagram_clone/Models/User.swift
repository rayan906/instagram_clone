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
        .init(id: UUID().uuidString, username: "iron_man", profileImageUrl: "iron_man", fullName: "iron man"),
        .init(id: UUID().uuidString, username: "bat_man", profileImageUrl: "bat_man", fullName: "bat man"),
        .init(id: UUID().uuidString, username: "dr_strange", profileImageUrl: "dr_strange", fullName: "dr strange"),
        .init(id: UUID().uuidString, username: "spider_man", profileImageUrl: "spider_man", fullName: "Bat Man"),
        .init(id: UUID().uuidString, username: "captian_america", profileImageUrl: "captian_america", fullName: "captain america"),
        .init(id: UUID().uuidString, username: "hulk", profileImageUrl: "hulk", fullName: "hulk"),
        .init(id: UUID().uuidString, username: "thor", profileImageUrl: "thor", fullName: "thor")
    ]
}
