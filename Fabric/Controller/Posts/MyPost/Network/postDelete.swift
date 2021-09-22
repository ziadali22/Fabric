//
//  postDelete.swift
//  Fabric
//
//  Created by ziad on 12/09/2021.
//

import Foundation
extension PostDetailViewController {
    func deleteRequest(){
        AuthRequestRouter.deletePost(id: postId ?? 0).send(StringModel.self, then: deleteHandleResponse)
    }
    
    var deleteHandleResponse: HandleResponse<StringModel> {
        return { [weak self] (response) in
            guard let self = self else {return}
            
            switch response {
            case .failure(let error):
                self.showMessage(sub: error.localizedDescription)
            case .success(let model):
                if model.status{
                    guard let item = model.data else {return}
                    self.sucess(item: item)
                }else{
                    guard let errorMsg = model.msg else{return}
                    self.showMessage(sub: errorMsg)
                }
                
            }
        }
    }
    func sucess(item: String){
        self.showMessage(sub: "Post Deleted")
        let vc = storyboard?.instantiateViewController(withIdentifier: "listOfPosts") as! postsVC
        show(vc, sender: nil)
    }
    
    func deleteCommentRequest(id: Int?){
    AuthRequestRouter.deleteComment(id: id ?? 0).send(StringModel.self, then: handleDeleteResponse)
    }
    
    var handleDeleteResponse: HandleResponse<StringModel>  {
        return { [weak self] (response) in
            guard let self = self else {return}
            self.view.isUserInteractionEnabled = true
            switch response {
            case .failure(let error):
                self.showMessage(sub: error.localizedDescription)
            case .success(let model):
                if model.status{
                    guard let item = model.data else {return}
                    self.sucessDeleteComment(item: item)
                }else{
                    guard let errorMsg = model.msg else{return}
                    self.showMessage(sub: errorMsg)
                }
                
            }
        }
    }
    func sucessDeleteComment(item: String){
        self.showMessage(sub: "Comment Deleted")
        tableView.reloadData()
    }
        
    
    
}
