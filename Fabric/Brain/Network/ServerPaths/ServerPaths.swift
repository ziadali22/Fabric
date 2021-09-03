//
//  ServerPaths.swift
//  sabeelUser
//
//  Created by mohab on 3/21/20.
//  Copyright © 2020 mohab. All rights reserved.
//


import Foundation
enum ServerPaths : String {
    
    case login = "auth/login"
    case forgetPassword = "auth/password/forget"
    case checkCode = "auth/password/check"
    case saveChanges = "auth/password/reset"
    case register = "auth/register"
    case getCatefory = "categories"
    case follow_unfollow = "follow-unfollow-category"
    case intro = "setting/contact"
   
    var value : String {
        return self.rawValue
    }
    

}

