//
//  BaseModel.swift
//  Fabric
//
//  Created by ziad on 31/08/2021.
//

import Foundation
struct BaseModel<T: Codable&CodableInit>: Codable, CodableInit {
    let status: Bool
    let data : T?
    let msg: String?
}
struct BaseModelArray<T: Codable&CodableInit>: Codable, CodableInit {
    let status: Bool
    let data : [T]?
    let msg: String?
}
struct StringModel: Codable, CodableInit {
    let status: Bool
    let data : String?
    let msg: String?
}
struct BoolModel: Codable, CodableInit {
    let status: Bool
    let data : Bool?
    let msg: String?
}
struct IntegerModel: Codable, CodableInit {
    let status: Bool
    let data : String?
    let msg: String?
}
struct ValueModel: Codable, CodableInit {
    let status: Bool
    let msg: String?
}
