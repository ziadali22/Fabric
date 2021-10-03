//
//  PostDetail+NET.swift
//  Fabric
//
//  Created by ziad on 09/09/2021.
//

import Foundation
import  UIKit
extension PostDetailViewController{
     func postDetailRequest(){
        AuthRequestRouter.postDetail(id: postId ?? 0).send(BaseModel<Item>.self, then: handleResponse)
    }
    
    var handleResponse: HandleResponse<BaseModel<Item>> {
        return { [weak self] (response) in
            guard let self = self else {return}
            
            switch response {
            case .failure(let error):
                self.showMessage(sub: error.localizedDescription)
            case .success(let model):
                self.removeSpinner()
                if model.status{
                    guard let item = model.data else {return}
                    self.post = item
                    ///
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
        if item.contentType == "pdf"{
            DispatchQueue.main.async {
                self.videoPlayBtn.isHidden = true
            }
            //tableHeight.constant = CGFloat(item.comments?.count ?? 0) * 150
            self.navigationItem.title = item.itemDescription
            commentCount.text = String(item.comments?.count ?? 0)
            departmentText.text = item.category?.name
            userName.setTitle(item.user?.name, for: .normal)
            dateText.text = item.createdAt
            //openPdfBtn.isHidden = false
            
            pdfHanlder = {
                let content = item.content
                UIApplication.shared.openURL(URL(string: content ?? "")!)
            }
        }
        else if item.contentType == "video"{
            DispatchQueue.main.async {
                self.videoPlayBtn.isHidden = false
                self.openPdfBtn.isHidden = true
            }
            //tableHeight.constant = CGFloat(item.comments?.count ?? 0) * 200
            self.navigationItem.title = item.itemDescription
            commentCount.text = String(item.comments?.count ?? 0)
            departmentText.text = item.category?.name
            userName.setTitle(item.user?.name, for: .normal)
            dateText.text = item.createdAt
        }else{
            DispatchQueue.main.async {
                self.videoPlayBtn.isHidden = true
                self.openPdfBtn.isHidden = true
            }
            postImage.kf.indicatorType = .activity
            postImage.kf.setImage(with: URL(string: item.content ?? ""))
            self.navigationItem.title = item.itemDescription
            commentCount.text = String(item.comments?.count ?? 0)
            departmentText.text = item.category?.name
            userName.setTitle(item.user?.name, for: .normal)
            dateText.text = item.createdAt
            
            tableHeight.constant = CGFloat(item.comments?.count ?? 0) * 150
            //   //  //
            if item.user?.id != UserDataActions.getUserModel()?.id
            {
                self.deleteBtn.isHidden = true
                
            }
            else{
                
            }
        }

        
        
    }
    
}
