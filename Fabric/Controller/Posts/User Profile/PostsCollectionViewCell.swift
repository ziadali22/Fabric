//
//  PostsCollectionViewCell.swift
//  Fabric
//
//  Created by ziad on 09/09/2021.
//

import UIKit

class PostsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - outlets
    @IBOutlet weak var departmentTExt: UILabel!
    @IBOutlet weak var commentsNumb: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var postDate: UILabel!
    
    
    // MARK: - add dumb data
    func addData(item: Item){
        departmentTExt.text = item.title
        commentsNumb.text = String (item.comments?.count ?? 0)
        postImage.kf.setImage(with: URL(string: item.content ?? ""))
        userName.text = item.user?.name
        postDate.text = item.createdAt
    }
}
