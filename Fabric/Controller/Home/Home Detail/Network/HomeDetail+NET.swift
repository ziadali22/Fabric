//
//  HomeDetail+NET.swift
//  Fabric
//
//  Created by ziad on 09/09/2021.
//

import Foundation
import UIKit
extension HomeDetail{
    func HomeDetailRequest(){
        AuthRequestRouter.postDetail(id: homePostId ?? 0).send(BaseModel<Item>.self, then: handleResponse)
    }
    
    var handleResponse: HandleResponse<BaseModel<Item>> {
        return { [weak self] (response) in
            guard let self = self else {return}
            switch response {
            case .failure(let error):
                self.showMessage(sub: error.localizedDescription)
            case .success(let model):
                if model.status{
                    guard let item = model.data else {return}
                    self.homePost = item
                    self.userPostData(item: item)
                    self.homeTableView.reloadData()
                    
                }else{
                    guard let errorMsg = model.msg else{return}
                    self.showMessage(sub: errorMsg)
                }
                
            }
        }
    }
    func userPostData(item: Item){
        postImage.kf.setImage(with: URL(string: item.content ?? ""))
        departmentTitle.text = item.title
        userName.setTitle(item.user?.name, for: .normal)
        postDate.text = item.createdAt
        tableHeight.constant = CGFloat((item.comments?.count ?? 0) * 150)
        
        
    }
    
}
