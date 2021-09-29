//
//  HighestRatePostsCVC.swift
//  Fabric
//
//  Created by ziad on 31/08/2021.
//

import UIKit

class HighestRatePostsCVC: UICollectionViewCell {
    // MARK: - Outlet
    // Top View
    @IBOutlet weak var rateCellImage: UIImageView!
    @IBOutlet weak var rateDepartmentTitle: UILabel!
    @IBOutlet weak var rateCommentCount: UILabel!
    @IBOutlet weak var commentBtn: UIButton!
    // Bottom View
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var rateTextView: UITextView!
    
    // MARK: - Cell Configure
    func rateConfigure(item: MostComment){
        rateDepartmentTitle.text = item.category?.name
        rateCellImage.kf.setImage(with: URL(string: item.content ?? "") )
        rateCommentCount.text = String(item.comments?.count ?? 0)
        userName.text = item.user?.name
        date.text = item.createdAt
        rateTextView.text = item.mostCommentDescription
        
        
    }

}
