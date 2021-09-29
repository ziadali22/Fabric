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
    case userPosts(id:Int)
    case home(categoryId: [Int]?)
    case homeFilter(categoryId: [Int]?)
    case contactUs(name: String, phone: String, email: String, message: String)
    case postDetail(id:Int)
    case deletePost(id:Int)
    case deleteComment(id:Int)
    case notification
    case createPost(contentType : Any, description: String, categoryId: Int)
    case changePassword(password: String, confirm: String)
    case UpdateProfile(name: String, phone: String, email: String)
    case myCategories
    case reportComment(id:Int)
    case search(text:String)
    
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
        case .userPosts(let id):
            return ServerPaths.postDetail.value + String(id)
        case .home:
            return ServerPaths.home.value
        case .contactUs:
            return ServerPaths.contactUs.value
        case .notification:
            return ServerPaths.notifications.value
        case .postDetail(let id):
            return ServerPaths.postDetail.value +  String(id)
        case .deletePost(let id):
            return ServerPaths.postDetail.value + String(id)
        case .changePassword:
            return ServerPaths.changePassword.value
        case .createPost:
            return ServerPaths.myPosts.value
        case .deleteComment(let id):
            return ServerPaths.deleteComment.value + String(id)
        case .UpdateProfile:
            return ServerPaths.updateProfile.value
        case .reportComment(let id):
            return ServerPaths.reportComment.value + String(id)
        case .myCategories:
            return ServerPaths.myCategory.value
        case .search:
            return ServerPaths.search.value
        case .homeFilter:
            return ServerPaths.home.value
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
        case .changePassword(let password, let confirm):
            params["password"] = password
            params["password_confirmation"] = confirm
        
        case .createPost(let contentType, let description, let categoryId):
            params["content_type"] = contentType
            params["description"] = description
            params["category_id"] = categoryId
        case .UpdateProfile(let name, let phone, let email):
            params["name"] = name
            params["phone"] = phone
            params["email"] = email
        case .search(let text):
            params["text"] = text
            
        case .home(let categoryId):
            if let category = categoryId{
            params["category[]"] = category
            }
        default:
            break
        }
        print(params)
        return params
    }
    // MARK: - Methods
    internal var method: HTTPMethod {
        switch self {
        case .getCategories , .intro , .home, .myPosts, .userPosts , .notification, .postDetail, .myCategories, .search, .homeFilter:
            return .get
        case .changePassword:
            return .put
        case .deletePost, .deleteComment:
            return .delete
        default:
            return .post
        }
       
        
    }
    
    
    
    
}


