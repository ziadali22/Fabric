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
    case getCategory = "categories"
    case follow_unfollow = "follow-unfollow-category"
    case intro = "setting/contact"
    case myPosts = "posts"
    case home = "home"
    case contactUs = "post-contact"
    case notifications = "notification"
    case postDetail = "posts/"
    case changePassword = "auth/change-password"
    case deleteComment = "comments/"
    case updateProfile = "auth/profile"
    case reportComment = "report-comment/"
    var value : String {
        return self.rawValue
    }
    

}

