//
//  NotificationModel.swift
//  Fabric
//
//  Created by ziad on 07/09/2021.
//

import Foundation
struct NotificationModel: Codable, CodableInit {
    let id: String?
    let type: String?
    let notifiableType: String?
    let notifiableID: Int?
    let data: NotificationDataClass?
    let readAt: String?
    let createdAt: String?
    let updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, type
        case notifiableType = "notifiable_type"
        case notifiableID = "notifiable_id"
        case data
        case readAt = "read_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - DataClass
struct NotificationDataClass: Codable,CodableInit {
    let title, enTitle, body: String?

    enum CodingKeys: String, CodingKey {
        case title
        case enTitle = "en_title"
        case body
    }
}
