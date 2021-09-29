//
//  MyAccount+NET.swift
//  Fabric
//
//  Created by ziad on 28/09/2021.
//

import Foundation
extension MyAccountViewController{
    func updateUserProfileRequest(){
        sendBtnOutlet.showLoader()
        let header = ["Authorization":"Berear\(UserDataActions.getUserModel()?.token ?? "")", "Accept": "application/json"]
        let url  = "http://fabric.panorama-q.com/api/auth/profile"
        let parameters = ["_method": "put" ,"name": nameField.text ?? "","phone": phoneNumber.text ?? "","email":emailField.text ?? ""]
        if uploadedImage != nil{
            if let image = uploadedImage{
                let imageArr = [image]
                AlamofireMultiPart.PostMultiWithModel(model: BaseModel<User>.self, url: url, Images: imageArr, header: header, parameters: parameters, completion: handleResponse)
            }
            
        }else{
            AlamofireMultiPart.PostMultiWithModel(model: BaseModel<User>.self, url: url, Images: nil, header: header, parameters: parameters, completion: handleResponse)
        }
        
        func handleResponse(result: ServerResponse<BaseModel<User>>){
            switch result {
            case .failure(let error):
                self.showMessage(sub: error?.localizedDescription)
            case .success(let model):
                if model.status{
                    self.showMessage(sub: "Profile Updated Successfully !".localized)
                    sendBtnOutlet.dismissLoader()
                    guard let user = model.data else { return  }
                    UserDataActions.cashUserModel(user: user)
                    self.navigationController?.popViewController(animated: true)
                    userImage.kf.setImage(with: URL(string: (UserDataActions.getUserModel()?.photo)!))
                }else{
                    guard let errorMsg = model.msg else{return}
                    self.showMessage(sub: errorMsg)
                }
                
            }
        }

    }
}
