//
//  followAndUnfollow.swift
//  Fabric
//
//  Created by ziad on 02/09/2021.
//

import Foundation
extension DepartmentsVC{
    func Request(id: Int?){
        
        AuthRequestRouter.follow_unfollow(id: id ?? 0).send(StringModel.self, then: handleResponse)
            
        
    }
    
    var handleResponse: HandleResponse<StringModel> {
        return { [weak self] (response) in
            guard let self = self else {return}
            switch response {
            case .failure(let error):
                self.showMessage(sub: error.localizedDescription)
            case .success(let model):
                if model.status{
                    guard let item = model.data else {return}
                    self.success(msg: item)
                }else{
                    guard let errorMsg = model.msg else{return}
                    self.showMessage(sub: errorMsg)
                }
                
            }
        }
    }
    func success(msg: String){
        self.showMessage(sub: "Operation Done Successfully")
    }
}


