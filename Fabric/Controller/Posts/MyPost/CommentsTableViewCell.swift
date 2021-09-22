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
    @IBOutlet weak var imageContent: UIImageView!
    
    
    var deleteHandelr: ActionClouser?
    var reportHandler: ActionClouser?
    
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

    
    @IBAction func reportComment(_ sender: Any) {
        reportHandler?()
    }
    @IBAction func deleteComment(_ sender: UIButton) {
        deleteHandelr?()
        
    }

    
    func cellConfigure(item: Comment){
        userNameComment.text = item.user?.name
        date.text = item.createdAt
        userImage.kf.setImage(with: URL(string: item.user?.photo ?? ""),placeholder: UIImage(named: "1276px-Placeholder_view_vector.svg"))
        
        if item.type == "image"{
            imageContent.kf.setImage(with: URL(string: item.comment ?? ""),placeholder: UIImage(named: "1276px-Placeholder_view_vector.svg"))
            commentView.isHidden = true
        }else{
            //userImage.isHidden = true
            commentView.text = item.comment
        }
        var item = item
        if item.isReported == true{
            reportBtnOutlet.isHidden = true
            item.isReported = false
        }else{
            reportBtnOutlet.isHidden = false
            item.isReported = true
        }
        
        if item.user?.id != UserDataActions.getUserModel()?.id
        {
            self.deleteComment.isHidden = true
        }
    }
    
}
