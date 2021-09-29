//
//  NewstPostsCVC.swift
//  Fabric
//
//  Created by ziad on 31/08/2021.
//

import UIKit
import Kingfisher

class NewstPostsCVC: UICollectionViewCell {
    
    // MARK: - Outlet
    @IBOutlet weak var departmentTitle: UILabel!
    @IBOutlet weak var commentBtn: UIButton!
    @IBOutlet weak var commentCount: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var datePost: UILabel!
    @IBOutlet weak var textView: UITextView!
    // MARK: - Cell Configuration
    func NewstPostConfigure(item: MostComment) {
        departmentTitle.text = item.category?.name
        cellImage.kf.setImage(with: URL(string: item.content ?? "") )
        commentCount.text = String(item.comments?.count ?? 0)
        UserName.text = item.user?.name
        textView.text = item.mostCommentDescription
        departmentTitle.text?.localized
        
    }
}
