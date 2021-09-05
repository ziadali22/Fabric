//
//  NewstPostsCVC.swift
//  Fabric
//
//  Created by ziad on 31/08/2021.
//

import UIKit

class NewstPostsCVC: UICollectionViewCell {
    @IBOutlet weak var departmentTitle: UILabel!
    @IBOutlet weak var commentBtn: UIButton!
    @IBOutlet weak var commentCount: UILabel!
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var datePost: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    func NewstPostConfigure(title: String, image: String, comntCount: String, user: String, date: String, txtView: String) {
        departmentTitle.text = title
        cellImage.image = UIImage(named: image)
        commentCount.text = comntCount
        UserName.text = user
        textView.text = txtView
        
    }
}
