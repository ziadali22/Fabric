//
//  SearchBar.swift
//  Fabric
//
//  Created by ziad on 27/09/2021.
//

import Foundation
import UIKit

extension AddPosts: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // network request
        searchRequest(searchBarText: searchBar.text ?? "")
    }
    
    func searchRequest(searchBarText: String){
        AuthRequestRouter.search(text: searchBarText).send(BaseModel<MyPosts>.self, then: searchHandleResponse)
    }
    
    var searchHandleResponse: HandleResponse<BaseModel<MyPosts>> {
        return { [weak self] (response) in
            guard let self = self else {return}
            self.view.isUserInteractionEnabled = true
            switch response {
            case .failure(let error):
                self.showMessage(sub: error.localizedDescription)
            case .success(let model):
                if model.status{
                    guard let item = model.data?.items else {return}
                   // self.myposts = item.items!
                    let storyBoard = UIStoryboard.init(name: "Posts", bundle: Bundle.main)
                    let vc = storyBoard.instantiateViewController(withIdentifier: "listOfPosts") as! postsVC
                    vc.myposts = item
                    vc.isSearch = true
                    self.show(vc,sender: nil)
                }else{
                    guard let errorMsg = model.msg else{return}
                    self.showMessage(sub: errorMsg)
                }
                
            }
        }
    }
}
