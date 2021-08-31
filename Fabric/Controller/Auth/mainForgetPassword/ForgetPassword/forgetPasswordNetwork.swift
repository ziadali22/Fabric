//
//  forgetPasswordNetwork.swift
//  Fabric
//
//  Created by ziad on 31/08/2021.
//

import Foundation
extension ForgetPasswordVC {
    func apiRequest(){
        self.sendCodeBtn.showLoader()
        AuthRequestRouter.foregtPassword(phone: phoneNumberTextField.text ?? "" ).send(StringModel.self, then: handleResponse)
    }
    
    var handleResponse: HandleResponse<StringModel> {
        return { [weak self] (response) in
            guard let self = self else {return}
            self.sendCodeBtn.dismissLoader()
            switch response {
            case .failure(let error):
                self.showMessage(sub: error.localizedDescription)
            case .success(let model):
                if model.status{
                    guard let item = model.data else {return}
                    self.successSendNumber(msg: item)
                    self.success()
                }else{
                    guard let errorMsg = model.msg else{return}
                    self.showMessage(sub: errorMsg)
                }
                
            }
        }
    }
    func successSendNumber(msg: String){
        self.showMessage(sub: "code sucessfully sent")
    }
    
}
