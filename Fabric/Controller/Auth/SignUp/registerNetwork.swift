//
//  registerNetwork.swift
//  Fabric
//
//  Created by ziad on 01/09/2021.
//

import Foundation
import SkyFloatingLabelTextField
extension SignUpVC {
    func apiRequest(){
        self.signUpBtn.showLoader()
        AuthRequestRouter.register(phone: phoneNumberTextField.text ?? "", email:emailTextField.text ?? "" , password: passwordTextField.text ?? "", name: nameTextField.text ?? "", categories: categoryId, fcm: "1234567").send(BaseModel<User>.self, then: handleResponse)
    }
    
    var handleResponse: HandleResponse<BaseModel<User>> {
        return { [weak self] (response) in
            guard let self = self else {return}
            self.signUpBtn.dismissLoader()
            switch response {
            case .failure(let error):
                self.showMessage(sub: error.localizedDescription)
            case .success(let model):
                if model.status{
                    guard let item = model.data else {return}
                    self.successRegister(msg: item)
                }else{
                    guard let errorMsg = model.msg else{return}
                    self.showMessage(sub: errorMsg)
                }
                
            }
        }
    }
    
    func successRegister(msg: User){
        self.showMessage(sub: "Register successfully")
    }
    
    func getCategoriesApi(){
        AuthRequestRouter.getCategories.send(BaseModelArray<CategoryModel>.self, then: handleGetResponse)
    }
    var handleGetResponse: HandleResponse<BaseModelArray<CategoryModel>> {
        return { [weak self] (response) in
            guard let self = self else {return}
            self.signUpBtn.dismissLoader()
            switch response {
            case .failure(let error):
                self.showMessage(sub: error.localizedDescription)
            case .success(let model):
                if model.status{
                    guard let item = model.data else {return}
                    self.categoryData = item
                    print(self.categoryData!)
                }else{
                    guard let errorMsg = model.msg else{return}
                    self.showMessage(sub: errorMsg)
                }
                
            }
        }
    }
    func apiResponse(){
        
    }
    
}


