//
//  APIManager.swift
//  SwiftCairo-App
//
//  Created by mohab on 1/29/18.
//  Copyright © 2018 mohab. All rights reserved.
//

import Foundation
import Alamofire



/// Response completion handler beautified.
typealias CallResponse<T> = ((Result<T>)-> Void)?


/// API protocol, The alamofire wrapper
protocol APIRequestHandler: HandleAlamoResponse {
    
    
}

extension APIRequestHandler where Self: URLRequestBuilder {
    
    func send<T: CodableInit>(_ decoder: T.Type, data: [UploadData]? = nil, pathPDF: [UploadDataURL]? = nil, progress: ((Progress) -> Void)? = nil, then: CallResponse<T>) {
        if let data = data {
            uploadToServerWith(decoder, data: data,pdf: pathPDF, request: self, parameters: self.parameters, progress: progress, then: then)
        }else{
            request(self).validate().responseData {(response) in
                self.handleResponse(response, then: then)
            }.responseJSON { (response) in
                // handle debug
                print(response.result.value)
            }
        }
    }
    
    func cancelRequest() -> Void {
        let sessionManager = Alamofire.SessionManager.default
        sessionManager.session.getTasksWithCompletionHandler { dataTasks, uploadTasks, downloadTasks in
            dataTasks.first(where: { $0.originalRequest?.url == self.requestURL})?.cancel()
            uploadTasks.first(where: { $0.originalRequest?.url == self.requestURL})?.cancel()
            downloadTasks.first(where: { $0.originalRequest?.url == self.requestURL})?.cancel()
        }
    }
}


extension APIRequestHandler {
    
    private func uploadToServerWith<T: CodableInit>(_ decoder: T.Type, data: [UploadData] ,pdf : [UploadDataURL]? = nil, request: URLRequestConvertible, parameters: Parameters?, progress: ((Progress) -> Void)?, then:  CallResponse<T>) {
        
        upload(multipartFormData: { (mul) in
            //mul.append(data.data, withName: data.name, fileName: "Image.jpg", mimeType: "image/jpg")
            
            for uploadData in data{
                if  uploadData.type == "video"{
                    guard let video = uploadData.videoURL else {return}
                    mul.append(video,
                               withName: uploadData.name,
                               fileName: "\(NSDate().timeIntervalSince1970).mp4",
                               mimeType: "/mp4")
                    
                }else{
                    guard let data = uploadData.data else {return}
                    mul.append(data,
                               withName: uploadData.name,
                               fileName: "\(Date().timeIntervalSince1970).jpg",
                               mimeType: "image/jpg")
                }
                
            }
            if let pdf = pdf{
                for uploadPdf in pdf{
                    mul.append(uploadPdf.data,
                               withName: uploadPdf.name,
                               fileName: "\(Date().timeIntervalSince1970).pdf",
                               mimeType: "application/pdf")
                }
            }
            guard let parameters = parameters else { return }
            for (key, value) in parameters {
                mul.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
            }
        }, with: request) { (response) in
            switch response {
            case .success(let requestUp, _, _):
                requestUp.responseData(completionHandler: { (results) in
                    self.handleResponse(results, then: then)
                }).responseString(completionHandler: { (string) in
                    print(string.result.value)
                })
            case .failure(let error):
                then?(Result<T>.failure(error))
            }
        }
    }
    
    private func uploadToServerWith<T: CodableInit>(_ decoder: T.Type, data: [String], request: URLRequestConvertible, parameters: Parameters?, progress: ((Progress) -> Void)?, then:  CallResponse<T>) {
        
        upload(multipartFormData: { (mul) in
            for uploadData in data{
                if let pdfurl = URL(string: uploadData) {
                    mul.append(pdfurl,
                               withName: "file",
                               fileName: "\(Date().timeIntervalSince1970).pdf",
                               mimeType: "application/pdf")
                }
            }
            
            guard let parameters = parameters else { return }
            for (key, value) in parameters {
                mul.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
            }
        }, with: request) { (response) in
            switch response {
            case .success(let requestUp, _, _):
                requestUp.responseData(completionHandler: { (results) in
                    self.handleResponse(results, then: then)
                }).responseString(completionHandler: { (string) in
                    print(string.result.value)
                })
            case .failure(let error):
                then?(Result<T>.failure(error))
            }
        }
    }
    
    
    
}






