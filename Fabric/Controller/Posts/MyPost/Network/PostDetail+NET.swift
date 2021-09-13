//
//  PostDetail+NET.swift
//  Fabric
//
//  Created by ziad on 09/09/2021.
//

import Foundation
import  UIKit
extension PostDetailViewController{
    
    public func postDetailRequest(){
        self.view.showLoader()
        AuthRequestRouter.postDetail(id: postId ?? 0).send(BaseModel<Item>.self, then: handleResponse)
    }
    
    var handleResponse: HandleResponse<BaseModel<Item>> {
        return { [weak self] (response) in
            guard let self = self else {return}
            self.view.dismissLoader()
            switch response {
            case .failure(let error):
                self.showMessage(sub: error.localizedDescription)
            case .success(let model):
                if model.status{
                    guard let item = model.data else {return}
                    self.post = item
                    self.dataBack(item: item)
                    self.tableView.reloadData()
                    
                }else{
                    guard let errorMsg = model.msg else{return}
                    self.showMessage(sub: errorMsg)
                }
                
            }
        }
    }
    func dataBack(item: Item){
        postImage.kf.setImage(with: URL(string: item.content ?? ""))
        departmentText.text = item.title
        userName.setTitle(item.user?.name, for: .normal)
        dateText.text = item.createdAt
        tableHeight.constant = CGFloat(item.comments?.count ?? 0) * 200
        //   //  //
        if item.user?.id != UserDataActions.getUserModel()?.id
        {
            self.deleteBtn.isHidden = true
        }
        else{
            
        }
        // check for the post id 
        
    }
    
}
