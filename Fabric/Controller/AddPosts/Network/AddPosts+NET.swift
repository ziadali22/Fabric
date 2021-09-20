//
//  AddPosts+NET.swift
//  Fabric
//
//  Created by ziad on 14/09/2021.
//

import Foundation
import Alamofire
import MobileCoreServices
extension AddPosts{
    func uploadAddPostRequest(text: String?){
        self.addPostBtn.showLoader()
        // url
        let url = URL(string: "http://fabric.panorama-q.com/api/posts" )
        print(url!)
        
        //Header - > token
        guard let apiToken = UserDataActions.getUserModel()?.token else{return }
        //let commmentTV = self.commentText.text.data(using: .utf8)!
        
        
        //paramter
        //let contentType = [video ?? "",pdf ?? "",image ?? "", text ?? ""] as [Any]
        //let parameters = ["content_type":contentType,"description":commentText.text!,"category_id": categoryId ?? 0] as [String : Any]
        
        
        // image - video - pdf
        Alamofire.upload(multipartFormData: { (form: MultipartFormData) in
            
            if let UploadText = text{
                form.append("text".data(using: String.Encoding.utf8)!, withName: "content_type")
                form.append(UploadText.data(using: .utf8)!, withName: "description")
            }
            
//            if let uploadedImage = self.imagePicker{
//                form.append("image/".data(using: String.Encoding.utf8)!, withName: "content_type")
//                let imageData = uploadedImage.jpegData(compressionQuality: 0.5)
//                form.append(imageData!, withName: "content")
//
//
//            }
            
            form.append("\(self.categoryId ?? 0)".data(using: .utf8)!, withName: "category_id")
            print("DATA: \(form)")
            
        }, to: "http://fabric.panorama-q.com/api/posts", method: .post, headers: ["Authorization":"Berear\(apiToken)", "Accept": "application/json"])  { (response:SessionManager.MultipartFormDataEncodingResult) in
            self.addPostBtn.dismissLoader()
            //print(response)
            
            switch response{
            case .success(request: let upload, _, _):
                upload.uploadProgress { (progress:Progress) in
                    self.showMessage(sub: "post added sucessfully")
                    print(progress)
                }
               
            upload.responseData { response in
                print("Response:\(response)")
                print(response.result.value ?? "")
                if let err = response.error{
                    print(err)
                }
            
                if let data = response.data{
                    print(data)
                }
            }
            
            case .failure(let encodingError):
                print(encodingError)
            }
        }

    }
    
}

//            if let image = image{
//                // convert image to Data
//                let imageData = image.jpegData(compressionQuality: 0.1)!
//                form.append(imageData, withName: "content",fileName: "file.jpg", mimeType: "image/jpg")
//            }
//            if let video = video{
//                form.append(video, withName: "content", fileName: "\(NSDate().timeIntervalSince1970).mp4", mimeType: "/mp4")
//            }
//            if let pdf = pdf {
//                form.append(pdf, withName: "content", fileName: "\(Date().timeIntervalSince1970).pdf", mimeType: "application/pdf")
//            }
//
//            //Paramter
//            for (key, value) in parameters {
//                form.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
//            }
