//
//  posts+Network.swift
//  Fabric
//
//  Created by ziad on 06/09/2021.
//

import Foundation
extension postsVC{
    @objc func myPostsRequest(){
        self.view.showLoader()
        AuthRequestRouter.myPosts.send(BaseModel<MyPosts>.self, then: handleResponse)
    }
    
    var handleResponse: HandleResponse<BaseModel<MyPosts>> {
        return { [weak self] (response) in
            guard let self = self else {return}
            self.view.dismissLoader()
            self.refreshControlTwo.endRefreshing()
            switch response {
            case .failure(let error):
                self.showMessage(sub: error.localizedDescription)
            case .success(let model):
                if model.status{
                    guard let item = model.data else {return}
                    self.myposts = item.items!
                    self.collectionview.reloadData()
                }else{
                    guard let errorMsg = model.msg else{return}
                    self.showMessage(sub: errorMsg)
                }
                
            }
        }
    }
    
    
}
