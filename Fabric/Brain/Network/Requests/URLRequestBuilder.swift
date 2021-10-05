//
//  RequestBuilderProtocol.swift
//  SwiftCairo-App
//
//  Created by mohab on 4/21/18.
//  Copyright © 2018 mohab. All rights reserved.
//

import Foundation
import Alamofire

protocol URLRequestBuilder: URLRequestConvertible, APIRequestHandler {
    
    var mainURL: URL { get }
    var requestURL: URL { get }
    // MARK: - Path
    var path: String { get }
    //Header
    var headers: HTTPHeaders { get }
    // MARK: - Parameters
    var parameters: Parameters? { get }
    
    // MARK: - Methods
    var method: HTTPMethod { get }
    
    var encoding: ParameterEncoding { get }
    
    var urlRequest: URLRequest { get }
}


extension URLRequestBuilder {
    var encoding: ParameterEncoding {
    
        switch method {
        case .get:
            if parameters == nil {
                return URLEncoding.default
            }else{
                return URLEncoding.queryString
            }
            
        default:
            return JSONEncoding.default
        }
    }
    
    var mainURL: URL  {
        return URL(string: "http://fabric.panorama-q.com/api/")!
    }
    
    var requestURL: URL {
        if path.hasPrefix("http://fabric.panorama-q.com/api/"){
            print(URL(string: path)!)
            return URL(string: path)!
        }else{
            print(mainURL.appendingPathComponent(path))
          return mainURL.appendingPathComponent(path)
        }
        
    }
    var headers: HTTPHeaders {
        var header = HTTPHeaders()
        if let myHeader = UserDataActions.HeaderForRequestWithToken(){
            header = myHeader
        }
        header["Accept"] = "application/json"
        header["X-localization"] = Language.currentLanguage()
        print(header)
        return header
    }
    
    var urlRequest: URLRequest {
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        headers.forEach { request.addValue($1, forHTTPHeaderField: $0) }
        return request
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        return try encoding.encode(urlRequest, with: parameters)
    }
}
