//
//  categoryModel.swift
//  Fabric
//
//  Created by ziad on 01/09/2021.
//

import Foundation
struct CategoryModel: Codable, CodableInit {
    var id: Int?
    var name: String?
    let logo: String?
    var isFollowed: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id, name, logo
        case isFollowed = "is_followed"
    }
}

