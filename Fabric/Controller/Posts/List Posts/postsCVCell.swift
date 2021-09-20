//
//  postsCVCell.swift
//  Fabric
//
//  Created by ziad on 05/09/2021.
//

import UIKit

class postsCVCell: UICollectionViewCell {
    
    
    
    
    @IBOutlet weak var DepartmentTitle: UILabel!
    @IBOutlet weak var commentBtn: UIButton!
    @IBOutlet weak var commentCount: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var date: UILabel!
    
    func postsCvonfigure(item: Item){
        cellImage.kf.setImage(with: URL(string: item.content ?? "") )
        DepartmentTitle.text = item.category?.name
        commentCount.text = String(item.comments?.count ?? 0)
        date.text = item.createdAt
        
        
    }

    
    
}
