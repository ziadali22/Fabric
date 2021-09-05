//
//  postsCVCell.swift
//  Fabric
//
//  Created by ziad on 05/09/2021.
//

import UIKit

class postsCVCell: UICollectionViewCell {
    
    @IBOutlet weak var removePost: UIButton!
    
    @IBOutlet weak var DepartmentTitle: UILabel!
    
    
    @IBOutlet weak var commentBtn: UIButton!
    @IBOutlet weak var commentCount: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var date: UILabel!
    
    func postsConfigure(_ cellimage: String,_ department : String, _ comontCount: String ,_ newDate: String){
        cellImage.image = UIImage(named: cellimage)
        DepartmentTitle.text = department
        commentCount.text = comontCount
        date.text = newDate
    }
    
}
