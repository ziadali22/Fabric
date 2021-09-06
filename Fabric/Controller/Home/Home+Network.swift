//
//  Home+Network.swift
//  Fabric
//
//  Created by ziad on 06/09/2021.
//

import Foundation
extension HomeViewController{
    
    func Request(){
        AuthRequestRouter.home.send(BaseModel<Home>.self, then: handleResponse)
    }

    var handleResponse: HandleResponse<BaseModel<Home>> {
        return { [weak self] (response) in
            guard let self = self else {return}
            self.view.isUserInteractionEnabled = true
            switch response {
            case .failure(let error):
                self.showMessage(sub: error.localizedDescription)
            case .success(let model):
                if model.status{
                    guard let item = model.data else {return}
                    self.postsData = item.posts
                    self.mostRateData = item.mostComments
                    self.newstPostsCollectionView.reloadData()
                    self.hieghtsRatesCollectionView.reloadData()
                    
                }else{
                    guard let errorMsg = model.msg else{return}
                    self.showMessage(sub: errorMsg)
                }
                
            }
        }
    }
    
}




