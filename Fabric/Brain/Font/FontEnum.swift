//
//  FontEnum.swift
//  sabeelUser
//
//  Created by Abulrahman mohsen on 3/21/20.
//  Copyright © 2020 Abulrahman mohsen. All rights reserved.
//

import UIKit

struct AppFont {
    static let defaultSystemFont = UIFont.systemFont(ofSize: 18)
    enum Cairo: String {
        case light      = "Cairo-Light"
        case regular    = "Cairo-Regular"
        case black      = "Cairo-Black"
        case bold       = "Cairo-Bold"
        case extraLight = "Cairo-ExtraLight"
        case semiBold   = "Cairo-SemiBold"
        var value :String {
            return self.rawValue
        }
    }
    
    enum PNU: String{
        case regular = "PNU-Regular"
        case light = "PNU-Light"
        case Bold = "PNU-Bold"
        case Medium = "PNU-Medium"
        var value :String {
            return self.rawValue
        }
    }
    
    enum Almarai: String {
        case Regular      = "Almarai-Regular"
        case Bold    = "Almarai-Bold"
        var value :String {
            return self.rawValue
        }
    }
    
    enum STC : String{
        case regular = "STC-Regular"
        case Light   = "STC-Light"
        case Bold    = "STC-Bold"
        
        var value :String {
            return self.rawValue
        }
    }
    
}
