//
//  UserModel.swift
//  Fabric
//
//  Created by ziad on 31/08/2021.
//

import Foundation
struct User: Codable, CodableInit {
    let id: Int?
       let name, email, phone, token: String?
       let photo: String?
       let categories: [Category]?
   }

   // MARK: - Category
   struct Category: Codable {
       let id: Int?
       let name: String?
       let logo: String?
       let isFollowed: Bool?

       enum CodingKeys: String, CodingKey {
           case id, name, logo
           case isFollowed = "is_followed"
       }
   }
