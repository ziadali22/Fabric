//
//  deletePost+NET.swift
//  Fabric
//
//  Created by ziad on 28/09/2021.
//

import Foundation
extension postsVC {
    // MARK: - delete post
    func deleteRequest(item:Int?){
        AuthRequestRouter.deletePost(id: item ?? 0).send(StringModel.self, then: deleteHandleResponse)
    }
    var deleteHandleResponse: HandleResponse<StringModel> {
        return { [weak self] (response) in
            guard let self = self else {return}
            
            switch response {
            case .failure(let error):
                self.showMessage(sub: error.localizedDescription)
            case .success(let model):
                self.collectionview.reloadData()
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
        collectionview.reloadData()
    }

}
