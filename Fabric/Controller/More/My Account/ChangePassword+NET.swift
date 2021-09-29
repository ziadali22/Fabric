//
//  ChangePassword+NET.swift
//  Fabric
//
//  Created by ziad on 12/09/2021.
//

import Foundation
extension PopUPChangePasswordVC{
    func changePasswordRequest(){
        self.saveBtn.showLoader()
        AuthRequestRouter.changePassword(password: password.text ?? "", confirm: confirmPassword.text ?? "").send(StringModel.self, then: handleResponse)
    }
    var handleResponse: HandleResponse<StringModel> {
        return { [weak self] (response) in
            guard let self = self else {return}
            self.saveBtn.dismissLoader()
            switch response {
            case .failure(let error):
                self.showMessage(sub: error.localizedDescription)
            case .success(let model):
                if model.status{
                    guard let item = model.data else {return}
                    self.sucess(msg: item)
                    //UserDataActions.cashUserModel(user: item)
                }else{
                    guard let errorMsg = model.msg else{return}
                    self.showMessage(sub: errorMsg)
                }
                
            }
        }
    }
    func sucess(msg: String){
        self.showMessage(sub: "Password Changed Successfully")
        
    }
    
}
