//
//  changePasswordNetwork.swift
//  Fabric
//
//  Created by ziad on 31/08/2021.
//

import Foundation

extension changePasswordVC{
    func apiRequest(){
        self.saveChangesBtn.showLoader()
        AuthRequestRouter.saveChanges(phone: phone ?? "", code: code ?? "", password: passwordTextField.text ?? " ").send(BaseModel<User>.self, then: handleResponse)
    }
    
    var handleResponse: HandleResponse<BaseModel<User>> {
        return { [weak self] (response) in
            guard let self = self else {return}
            self.saveChangesBtn.dismissLoader()
            switch response {
            case .failure(let error):
                self.showMessage(sub: error.localizedDescription)
            case .success(let model):
                if model.status{
                    guard let item = model.data else {return}
                    self.sucessSendToHome(msg: item)
                    
                }else{
                    guard let errorMsg = model.msg else{return}
                    self.showMessage(sub: errorMsg)
                }
                
            }
        }
    }
    func sucessSendToHome(msg: User){
        self.showMessage(sub: "password change correctly")
    }
    
}


