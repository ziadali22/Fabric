//
//  DataFile.swift
//  SwiftCairo-App
//
//  Created by mohab on 7/4/18.
//  Copyright © 2018 mohab. All rights reserved.
//

import Foundation

struct UploadData {
    var data: Data? = nil
    var /*fileName, mimeType,*/ name: String
    var videoURL: URL? = nil
    var type: String
}

struct UploadDataURL {
    var data: URL
    var /*fileName, mimeType,*/ name: String
}
