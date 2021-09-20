//
//  AlamofreUploadUrl.swift
//  Fabric
//
//  Created by ziad on 19/09/2021.
//



import Foundation
import Alamofire

class AlamofireMultiPartUrl{
    
   static func PostMultiWithModel<T: Codable>(model :T.Type , url: String, URL: [UploadDataURL]?,header:[String:Any]?, parameters:[String: Any]?, completion: @escaping (ServerEsponse<T>) -> Void) {
      upload(multipartFormData: { (multipartFromData) in
        if parameters != nil{
          for (key, value) in parameters! {
            multipartFromData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key)
          }
        }
        
        if let url = URL{
            for uploadData in url{
                multipartFromData.append(uploadData.data,
                                         withName: uploadData.name)
                                         //fileName: "\(Date().timeIntervalSince1970).jpg",
                                         //mimeType: "application/pdf")
            }
        }
      }, usingThreshold: SessionManager.multipartFormDataEncodingMemoryThreshold, to: url , method: .post, headers: header as? HTTPHeaders) { (result) in
         
        switch result {
        case .failure(let error):
          print(error)
          completion(ServerEsponse<T>.failure(error))
        case .success(request: let upload, streamingFromDisk: _, streamFileURL: _):
          upload.responseJSON(completionHandler: { (response) in
             
            switch response.result {
            case .success(let value):
               print(value)
               
               
               
              do {
                let decoder = JSONDecoder()
                let modules = try decoder.decode(model, from: response.data!)
                completion(ServerEsponse<T>.success(modules))
              }catch {
                print("catch >>>>", error.localizedDescription)
                completion(ServerEsponse<T>.failure(error))
              }
               
            case .failure(let error):
              print(error)
              completion(ServerEsponse<T>.failure(error))
            }
          })
        }
      }
    }
    
    
}
enum ServerEsponse<T> {
    case success(T), failure(Error?)
}
