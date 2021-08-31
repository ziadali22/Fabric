//
//  CodableInit.swift
//  SwiftCairo-App
//
//  Created by mohabon 3/28/18.
//  Copyright © 2018 mohab. All rights reserved.
//

import Foundation

protocol CodableInit {
    init(data: Data) throws
}

extension CodableInit where Self: Codable {
    init(data: Data) throws {
        let decoder = JSONDecoder()
       // decoder.keyDecodingStrategy = .convertFromSnakeCase
        self = try decoder.decode(Self.self, from: data)
    }
}

