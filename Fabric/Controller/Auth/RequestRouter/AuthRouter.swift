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
        }
        print(params)
        return params
    }
    // MARK: - Methods
    internal var method: HTTPMethod {
        return .post
        
    }
    
    
    
    
}


