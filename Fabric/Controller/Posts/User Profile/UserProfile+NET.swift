//
//  UserProfile+NET.swift
//  Fabric
//
//  Created by ziad on 09/09/2021.
//

import Foundation
extension UserProfileViewController {
    func userProfileRequest(){
        AuthRequestRouter.myPosts.send(BaseModel<MyPosts>.self, then: handleResponse)
    }
    
    var handleResponse: HandleResponse<BaseModel<MyPosts>> {
        return { [weak self] (response) in
            guard let self = self else {return}
            self.view.isUserInteractionEnabled = true
            switch response {
            case .failure(let error):
                self.showMessage(sub: error.localizedDescription)
            case .success(let model):
                if model.status{
                    guard let item = model.data else {return}
                    self.myposts = item.items
                    self.firstCollection.reloadData()
                }else{
                    guard let errorMsg = model.msg else{return}
                    self.showMessage(sub: errorMsg)
                }
                
            }
        }
    }
    
    func userData(){
        AuthRequestRouter.postDetail(id: postId ?? 0).send(BaseModel<Item>.self, then: userDataHandleResponse)
    }
    
    var userDataHandleResponse: HandleResponse<BaseModel<Item>> {
        return { [weak self] (response) in
            guard let self = self else {return}
            self.view.isUserInteractionEnabled = true
            switch response {
            case .failure(let error):
                self.showMessage(sub: error.localizedDescription)
            case .success(let model):
                if model.status{
                    guard let item = model.data else {return}
                    self.addData(item: item)
                    //self.postId = item.id  
                }else{
                    guard let errorMsg = model.msg else{return}
                    self.showMessage(sub: errorMsg)
                }
                
            }
        }
    }
    func addData(item: Item){
        userImage.kf.setImage(with: URL(string: item.user?.photo ?? ""))
        userName.text = item.user?.name
        postsCount.text = String(item.itemDescription?.count ?? 0)
        userEmail.text = item.user?.email
       
    }
    
}
