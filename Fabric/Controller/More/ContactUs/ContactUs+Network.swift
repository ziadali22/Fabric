//
//  ContactUs+Network.swift
//  Fabric
//
//  Created by ziad on 07/09/2021.
//

import Foundation
extension contactUsViewController {
    func contactUsRequest(){
        self.sendBtn.showLoader()
        AuthRequestRouter.contactUs(name: nameTxtField.text ?? "", phone: phoneNumb.text ?? "", email: emailText.text ?? "", message: textView.text ?? "").send(StringModel.self, then: handleResponse)
    }
    
    var handleResponse: HandleResponse<StringModel> {
        return { [weak self] (response) in
            guard let self = self else {return}
            self.sendBtn.dismissLoader()
            switch response {
            case .failure(let error):
                self.showMessage(sub: error.localizedDescription)
            case .success(let model):
                if model.status{
                    guard let item = model.data else {return}
                    self.requestSent(msg: item)
                }else{
                    guard let errorMsg = model.msg else{return}
                    self.showMessage(sub: errorMsg)
                }
                
            }
        }
    }
    func requestSent(msg: String){
        self.showMessage(sub: "Message Sent Successfully")
    }
    
}
