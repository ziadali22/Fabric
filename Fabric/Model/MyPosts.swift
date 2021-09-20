//
//  MyPosts.swift
//  Fabric
//
//  Created by ziad on 06/09/2021.
//

import Foundation
struct MyPosts: Codable, CodableInit {
    let items: [Item]?
    let paginate: Paginate?
}

// MARK: - Item
struct Item: Codable, CodableInit {
    let id: Int?
    let itemDescription, title: String?
    var isReported: Bool?
    let user: User?
    let category: Category?
    let createdAt: String?
    let content: String?
    let contentType: String?
    let commentsCount: Int?
    let comments: [Comment]?

    enum CodingKeys: String, CodingKey {
        case id
        case itemDescription = "description"
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
// MARK: - Paginate
struct Paginate: Codable {
    let total, count, perPage: Int?
    let nextPageURL, prevPageURL: String?
    let currentPage, totalPages: Int?

    enum CodingKeys: String, CodingKey {
        case total, count
        case perPage = "per_page"
        case nextPageURL = "next_page_url"
        case prevPageURL = "prev_page_url"
        case currentPage = "current_page"
        case totalPages = "total_pages"
    }
}
