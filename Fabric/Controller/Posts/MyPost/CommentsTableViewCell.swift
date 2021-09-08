//
//  CommentsTableViewCell.swift
//  Fabric
//
//  Created by ziad on 08/09/2021.
//

import UIKit

class CommentsTableViewCell: UITableViewCell {

    @IBOutlet weak var commentsCount: UILabel!
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var commentView: UITextView!
    @IBOutlet weak var userImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        userImage.layer.cornerRadius = userImage.frame.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func reportBtn(_ sender: Any) {
    }
    @IBAction func deleteComment(_ sender: Any) {
    }
    
    
    func cellConfigure(_ commentCont: String, _ username: String, _ newDate: String, _ comment: String, _ image: String){
        commentsCount.text = commentCont
        userName.text = username
        date.text = newDate
        commentView.text = comment
        userImage.image = UIImage(named: image)
    }
}
