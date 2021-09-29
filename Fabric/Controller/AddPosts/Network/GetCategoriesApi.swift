//
//  GetCategoriesApi.swift
//  Fabric
//
//  Created by ziad on 28/09/2021.
//

import Foundation
extension AddPosts{
    // MARK: - Netowrk
    func getCategoriesApi(){
        self.view.showLoader()
        AuthRequestRouter.getCategories.send(BaseModelArray<CategoryModel>.self, then: handleGetResponse)
    }
    var handleGetResponse: HandleResponse<BaseModelArray<CategoryModel>> {
        return { [weak self] (response) in
            guard let self = self else {return}
            self.view.dismissLoader()
            switch response {
            case .failure(let error):
                self.showMessage(sub: error.localizedDescription)
            case .success(let model):
                if model.status{
                    guard let item = model.data else {return}
                    self.categories = item
                }else{
                    guard let errorMsg = model.msg else{return}
                    self.showMessage(sub: errorMsg)
                }
                
            }
        }
    }
}
