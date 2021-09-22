//
//  reportComment.swift
//  Fabric
//
//  Created by ziad on 21/09/2021.
//

import Foundation
extension PostDetailViewController{
    
    func reportRequest(id:Int?){
        AuthRequestRouter.reportComment(id: id ?? 0).send(StringModel.self, then: reportHandleResponse)
    }
    var reportHandleResponse: HandleResponse<StringModel> {
        return { [weak self] (response) in
            guard let self = self else {return}
            self.view.isUserInteractionEnabled = true
            switch response {
            case .failure(let error):
                self.showMessage(sub: error.localizedDescription)
            case .success(let model):
                if model.status{
                    guard let item = model.data else {return}
                    self.sucessReporting(msg: item)
                }else{
                    guard let errorMsg = model.msg else{return}
                    self.showMessage(sub: errorMsg)
                }
                
            }
        }
    }

    func sucessReporting(msg: String){
        self.showMessage(sub: "comment reported successfully ")
        
    }
}
