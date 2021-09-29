//
//  AlamofireMultiPart.swift
//  Fabric
//
//  Created by ziad on 19/09/2021.
//

import Foundation
import Alamofire

class AlamofireMultiPart{
    
    static func PostMultiWithModel<T: Codable>(model :T.Type , url: String, Images: [UploadData]?,header:[String:Any]?, parameters:[String: Any]?, completion: @escaping (ServerResponse<T>) -> Void) {
        upload(multipartFormData: { (multipartFromData) in
            if parameters != nil{
                for (key, value) in parameters! {
                    multipartFromData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key)
                }
            }
            
            for uploadData in Images ?? []{
                if uploadData.type == "pdf"{
                    guard let pdf = uploadData.videoURL else {return}
                    multipartFromData.append(pdf,
                                             withName: uploadData.name,
                                             fileName: "\(Date().timeIntervalSince1970).pdf",
                                             mimeType: "application/pdf")
                }else if uploadData.type == "video" {
                    guard let video = uploadData.videoURL else { return  }
                    multipartFromData.append(video,
                                             withName: uploadData.name,
                                             fileName: "\(Date().timeIntervalSince1970).mp4",
                                             mimeType: "/mp4")
                }else{
                    guard let image = uploadData.data else { return }
                    multipartFromData.append(image,
                                             withName: uploadData.name,
                                             fileName: "\(Date().timeIntervalSince1970).jpg",
                                             mimeType: "image/jpg")
                }
                
            }
//            if let uploadVideo = Images{
//                for uploadData in uploadVideo{
//                    if uploadData.type == "video" {
//                        //guard let video = uploadData.videoURL else { return  }
//                        multipartFromData.append(uploadData.videoURL!,
//                                                 withName: uploadData.name,
//                                                 fileName: "\(Date().timeIntervalSince1970).mp4",
//                                                 mimeType: "/mp4")
//                    }
//
//                }
//            }
            
        }, usingThreshold: SessionManager.multipartFormDataEncodingMemoryThreshold, to: url , method: .post, headers: header as? HTTPHeaders) { (result) in
            
            switch result {
            case .failure(let error):
                print(error)
                completion(ServerResponse<T>.failure(error))
            case .success(request: let upload, streamingFromDisk: _, streamFileURL: _):
                upload.responseJSON(completionHandler: { (response) in
                    
                    switch response.result {
                    case .success(let value):
                        print(value)
                        
                        
                        
                        do {
                            let decoder = JSONDecoder()
                            let modules = try decoder.decode(model, from: response.data!)
                            completion(ServerResponse<T>.success(modules))
                        }catch {
                            print("catch >>>>", error.localizedDescription)
                            completion(ServerResponse<T>.failure(error))
                        }
                        
                    case .failure(let error):
                        print(error)
                        completion(ServerResponse<T>.failure(error))
                    }
                })
            }
        }
    }
    
    
}
enum ServerResponse<T> {
    case success(T), failure(Error?)
}
