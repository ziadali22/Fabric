//
//  uploadPost+NET.swift
//  Fabric
//
//  Created by ziad on 28/09/2021.
//

import Foundation
extension AddPosts{
    func uploadRequest(){
        let header = ["Authorization":"Berear\(UserDataActions.getUserModel()?.token ?? "")", "Accept": "application/json"]
        if uploadedImage != nil{
            self.addPostBtn.showLoader()
            ///content_type": "image
            let parameters = ["content_type": "image","description":commentText.text!,"category_id": categoryId ?? 0] as [String : Any]
            //uploadM(SendParmaeters: parameters)
            if let image = uploadedImage {
                let imageArr = [image]
                AlamofireMultiPart.PostMultiWithModel(model: ValueModel.self,
                                                      url: "http://fabric.panorama-q.com/api/posts",
                                                      Images: imageArr, header: header, parameters: parameters, completion: handleResponse)
            }
        }
        else if uploadVideo != nil {
            ///content_type": "video
            self.addPostBtn.showLoader()
            let parameters = ["content_type": "video","description":commentText.text!,"category_id": categoryId ?? 0] as [String : Any]
            //uploadM(SendParmaeters: parameters)
            if let video = uploadVideo {
                let videoArr = [video]
                AlamofireMultiPart.PostMultiWithModel(model: ValueModel.self,
                                                      url: "http://fabric.panorama-q.com/api/posts",
                                                      Images: videoArr, header: header, parameters: parameters, completion: handleResponse)
            }
        }
        else if uploadPdf != nil{
            self.addPostBtn.showLoader()
            let parameters = ["content_type": "pdf","description":commentText.text!,"category_id": categoryId ?? 0] as [String : Any]
            //uploadM(SendParmaeters: parameters)
            if let pdf = uploadPdf {
                let pdfArr = [pdf]
                AlamofireMultiPart.PostMultiWithModel(model: ValueModel.self,
                                                      url: "http://fabric.panorama-q.com/api/posts",
                                                      Images: pdfArr, header: header, parameters: parameters, completion: handleResponse)
            }
        }
        else{
            
            self.addPostBtn.showLoader()
            uploadAddPostRequest(text: commentText.text)
        }

    }
    func handleResponse(result: ServerResponse<ValueModel>){
        
        switch result {
        case .failure(let error):
            self.showMessage(sub: error?.localizedDescription)
        case .success(let model):
            if model.status{
                self.addPostBtn.dismissLoader()
                self.showMessage(sub: "Post Added Succefully !".localized)
            }else{
                guard let errorMsg = model.msg else{return}
                self.showMessage(sub: errorMsg)
            }
            
        }
    }
}
