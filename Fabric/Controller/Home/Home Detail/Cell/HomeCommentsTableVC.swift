//
//  HomeCommentsTableVC.swift
//  Fabric
//
//  Created by ziad on 09/09/2021.
//

import UIKit

class HomeCommentsTableVC: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var commentsNumber: UILabel!
    @IBOutlet weak var commentsDate: UILabel!
    @IBOutlet weak var commentsTextView: UITextView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
        userImage.layer.cornerRadius = userImage.frame.height/2

        
    }

    
    func homeCellConfigure(item: Item){
        commentsNumber.text = String(item.comments?.count ?? 0)
        userName.text = item.user?.name
        commentsDate.text = item.createdAt
        commentsTextView.text = item.itemDescription
        userImage.kf.setImage(with: URL(string: item.user?.photo ?? ""))
    }
}
