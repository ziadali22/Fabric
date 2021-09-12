//
//  Notification+Network.swift
//  Fabric
//
//  Created by ziad on 12/09/2021.
//

import Foundation
extension NotificationViewController{
    func NotificationRequest(){
        AuthRequestRouter.notification.send(BaseModelArray<NotificationModel>.self, then: handleResponse)
    }
    
    var handleResponse: HandleResponse<BaseModelArray<NotificationModel>> {
        return { [weak self] (response) in
            guard let self = self else {return}
            self.view.isUserInteractionEnabled = true
            switch response {
            case .failure(let error):
                self.showMessage(sub: error.localizedDescription)
            case .success(let model):
                if model.status{
                    guard let item = model.data else {return}
                    self.notificationData = item
                    self.notificationTableView.reloadData()
                    
                }else{
                    guard let errorMsg = model.msg else{return}
                    self.showMessage(sub: errorMsg)
                }
                
            }
        }
    }
    
    
}
