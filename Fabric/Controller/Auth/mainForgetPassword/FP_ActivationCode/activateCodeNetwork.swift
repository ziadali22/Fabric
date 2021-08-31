//
//  activateCodeNetwork.swift
//  Fabric
//
//  Created by ziad on 31/08/2021.
//

import Foundation

extension ActivationCodeVC {
    func apiRequest(){
        self.activateBtn.showLoader()
        code = "\(FirstTextField.text ?? "")" + "\(SecondTextField.text ?? "")" + "\(ThirdTextField.text ?? "")" + "\(FourthTextField.text ?? "")"
        AuthRequestRouter.checkCode(code: code ?? "", phone: phone ?? "").send(BoolModel.self, then: handleResponse)
    }
    var handleResponse: HandleResponse<BoolModel> {
        return { [weak self] (response) in
            guard let self = self else {return}
            self.activateBtn.dismissLoader()
            switch response {
            case .failure(let error):
                self.showMessage(sub: error.localizedDescription)
            case .success(let model):
                if model.status{
                    guard let item = model.data else {return}
                    self.sucessAcceptCode(msg: item)
                    self.succes()
                }else{
                    guard let errorMsg = model.msg else{return}
                    self.showMessage(sub: errorMsg)
                }
                
            }
        }
    }
    func sucessAcceptCode(msg: Bool){
        self.showMessage(sub: "Code accepted")
    }
    
}
