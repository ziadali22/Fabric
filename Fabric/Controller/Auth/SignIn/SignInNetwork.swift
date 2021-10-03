//
//  SignInNetwoek.swift
//  Fabric
//
//  Created by ziad on 31/08/2021.
//

import Foundation
extension SignInVC{
    func signInRequest(){
        self.loginBtn.showLoader()
        AuthRequestRouter.login(phone: phoneNumberTextField.text ?? "", password: PasswordTextField.text ?? "", fcm: "124").send(BaseModel<User>.self, then: handleResponse)
    }
    var handleResponse: HandleResponse<BaseModel<User>> {
        return { [weak self] (response) in
            guard let self = self else {return}
            self.loginBtn.dismissLoader()
            switch response {
            case .failure(let error):
                self.showMessage(sub: error.localizedDescription)
            case .success(let model):
                if model.status{
                    guard let item = model.data else {return}
                    // casching the user Data
                    UserDataActions.cashUserModel(user: item)
                    // then send me to the home screen
                    self.successLogin()
                }else{
                    guard let errorMsg = model.msg else{return}
                    self.showMessage(sub: errorMsg)
                }
            }
        }
    }
    
    func successLogin(){
        // codre for sending to home screen
        self.showMessage(sub: "success login")
        let vc = storyboard?.instantiateViewController(identifier: "tapBar")
        vc?.modalPresentationStyle = .fullScreen
        vc?.modalTransitionStyle = .crossDissolve
        guard let controller = vc else { return  }
        present(controller, animated: true, completion: nil)
    }
}
