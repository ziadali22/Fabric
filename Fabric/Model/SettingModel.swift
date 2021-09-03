//
//  SettingModel.swift
//  Fabric
//
//  Created by ziad on 02/09/2021.
//

import Foundation
// MARK: - DataClass
struct Setting: Codable,CodableInit {
    let address, email, phone: String?
    let facebook, youtube, snap, instagram: String?
    let twitter: String?
    let terms, about, screenOne, screenTwo: String?

    enum CodingKeys: String, CodingKey {
        case address, email, phone, facebook, youtube, snap, instagram, twitter, terms, about
        case screenOne = "screen_one"
        case screenTwo = "screen_two"
    }
}
