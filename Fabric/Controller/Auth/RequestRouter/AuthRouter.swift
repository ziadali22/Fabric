//
//  AuthRouter.swift
//  Fabric
//
//  Created by ziad on 31/08/2021.
//

import Foundation

import Foundation
import Alamofire
enum AuthRequestRouter: URLRequestBuilder {
    
    case login(phone: String, password: String, fcm: String)
    case foregtPassword(phone: String)
    case checkCode(code: String, phone: String)
    case saveChanges(phone: String, code: String, password: String)
    case register(phone: String, email:String, password: String, name: String, categories: [Int], fcm:String)
    case getCategories
    case follow_unfollow(id: Int)
    case intro
    case myPosts
    case home
    case contactUs(name: String, phone: String, email: String, message: String)
    case postDetail(id:Int)
    
    case notification
    
    // MARK: - Path
    internal var path: String {
        switch self {
        case .login:
            return ServerPaths.login.value
        case .foregtPassword:
            return ServerPaths.forgetPassword.value
        case .checkCode:
            return ServerPaths.checkCode.value
        case .saveChanges:
            return ServerPaths.saveChanges.value
        case .register:
            return ServerPaths.register.value
        case .getCategories:
            return ServerPaths.getCategory.value
        case .follow_unfollow:
            return ServerPaths.follow_unfollow.value
        case .intro:
            return ServerPaths.intro.value
        case .myPosts:
            return ServerPaths.myPosts.value
        case .home:
            return ServerPaths.home.value
        case .contactUs:
            return ServerPaths.contactUs.value
        case .notification:
            return ServerPaths.notifications.value
        case .postDetail(let id):
            return ServerPaths.postDetail.value +  String(id)
        }
    }
    // MARK: - Parameters
    internal var parameters: Parameters? {
        var params = Parameters.init()
        switch self {
        case .login(let phone, let password, let fcm):
            params["phone"] = phone
            params["password"] = password
            params["fcm_token_ios"] = fcm
        
        case .foregtPassword(let phone):
            params["phone"] = phone
        case .checkCode(let code, let phone):
            params["code"] = code
            params["phone"] = phone
        case .saveChanges(let phone , let code, let password):
            params["phone"] = phone
            params["code"] = code
            params["password"] = password
        case .register(let phone, let email,let password,let name,let categories,let fcm):
            params["phone"] = phone
            params["email"] = email
            params["password"] = password
            params["name"] = name
            params["fcm_token_android"] = fcm
            
           // for i in categories{
                params["categories"] = categories
            //}
        case .follow_unfollow(let id ):
            params["category_id"] = id
        case .contactUs(let name,let phone, let email, let message):
            params["name"] = name
            params["phone"] = phone
            params["email"] = email
            params["message"] = message
            
       
        default:
            break
        }
        print(params)
        return params
    }
    // MARK: - Methods
    internal var method: HTTPMethod {
        switch self {
        case .getCategories , .intro , .home, .myPosts, .notification, .postDetail:
            return .get
        default:
            return .post
        }
       
        
    }
    
    
    
    
}


