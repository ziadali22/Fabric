//
//  HomeDepartment+NET.swift
//  Fabric
//
//  Created by ziad on 22/09/2021.
//

import Foundation
extension HomeDepartmentPopUp{
    func getDepartmentsRequest(){
        AuthRequestRouter.getCategories.send(BaseModelArray<CategoryModel>.self, then: handleGetResponse)
    }
    var handleGetResponse: HandleResponse<BaseModelArray<CategoryModel>> {
        return { [weak self] (response) in
            guard let self = self else {return}
            
            switch response {
            case .failure(let error):
                self.showMessage(sub: error.localizedDescription)
            case .success(let model):
                if model.status{
                    guard let item = model.data else {return}
                    self.categoryData = item
                    print(self.categoryData!)
                }else{
                    guard let errorMsg = model.msg else{return}
                    self.showMessage(sub: errorMsg)
                }
                
            }
        }
    }
}
