//
//  HomeModel.swift
//  Fabric
//
//  Created by ziad on 06/09/2021.
//

import Foundation

// MARK: - DataClass
struct Home: Codable, CodableInit {
    let posts, mostComments: [MostComment]?

    enum CodingKeys: String, CodingKey {
        case posts
        case mostComments = "most_comments"
    }
}

// MARK: - MostComment
struct MostComment: Codable,CodableInit {
    let id: Int?
    let mostCommentDescription, title: String?
    let isReported: Bool?
    let user: User?
    let category: Category?
    let createdAt: String?
    let content: String?
    let contentType: String?
    let commentsCount: Int?
    let comments: [Comment]?

    enum CodingKeys: String, CodingKey {
        case id
        case mostCommentDescription = "description"
        case title
        case isReported = "is_reported"
        case user, category
        case createdAt = "created_at"
        case content
        case contentType = "content_type"
        case commentsCount = "comments_count"
        case comments
    }
    
}

// MARK: - Comment
struct Comment: Codable {
    let id: Int?
    let type, comment: String?
    let pinned: Int?
    let isReported: Bool?
    let createdAt: String?
    let user: User?

    enum CodingKeys: String, CodingKey {
        case id, type, comment, pinned
        case isReported = "is_reported"
        case createdAt = "created_at"
        case user
    }
}
