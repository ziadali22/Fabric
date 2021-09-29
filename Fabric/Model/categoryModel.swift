//
//  categoryModel.swift
//  Fabric
//
//  Created by ziad on 01/09/2021.
//

import Foundation
struct CategoryModel: Codable, CodableInit {
    var id: Int?
    var name: String
    let logo: String?
    var isFollowed: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id, name, logo
        case isFollowed = "is_followed"
    }
}

struct myCategory: Codable, CodableInit {
    let allCategories, userCategories: [CategoryModel]?

    enum CodingKeys: String, CodingKey {
        case allCategories = "all_categories"
        case userCategories = "user_categories"
    }
}


