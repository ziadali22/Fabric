//
//  HighestRatePostsCVC.swift
//  Fabric
//
//  Created by ziad on 31/08/2021.
//

import UIKit

class HighestRatePostsCVC: UICollectionViewCell {
    // Top View
    @IBOutlet weak var rateCellImage: UIImageView!
    @IBOutlet weak var rateDepartmentTitle: UILabel!
    @IBOutlet weak var rateCommentCount: UILabel!
    @IBOutlet weak var commentBtn: UIButton!
    // Bottom View
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var rateTextView: UITextView!
    func rateConfigure(_ title:String,_ image: String, _ comntCount: String,_ user: String, _ rateDate: String, txtView: String ){
        rateDepartmentTitle.text = title
        rateCellImage.image = UIImage(named: image)
        rateCommentCount.text = comntCount
        userName.text = user
        date.text = rateDate
        rateTextView.text = txtView
    }
    
}
