//
//  CommentsTableViewCell.swift
//  Fabric
//
//  Created by ziad on 08/09/2021.
//
import Foundation
import UIKit

class CommentsTableViewCell: UITableViewCell {
    var commntIdForReport: Int?
    @IBOutlet weak var userNameComment: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var commentView: UITextView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var deleteComment: UIButton!
    @IBOutlet weak var reportBtnOutlet: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        userImage.layer.cornerRadius = userImage.frame.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
        // Configure the view for the selected state
    }
    
    
    func cellConfigure(item: Item){
        userNameComment.text = item.user?.name
        date.text = item.createdAt
        commentView.text = item.itemDescription
        userImage.kf.setImage(with: URL(string: item.user?.photo ?? ""),placeholder: UIImage(named: "1276px-Placeholder_view_vector.svg"))
        
        if item.isReported == true{
            reportBtnOutlet.isHidden = true
        }
        
        if item.user?.id != UserDataActions.getUserModel()?.id
        {
            self.deleteComment.isHidden = true
        }
    }
    
}
