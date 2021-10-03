//
//  CommentsTableViewCell.swift
//  Fabric
//
//  Created by ziad on 08/09/2021.
//
import Foundation
import UIKit

class CommentsTableViewCell: UITableViewCell {
    
    // MARK: - Outlet
    @IBOutlet weak var userNameComment: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var commentView: UITextView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var deleteComment: UIButton!
    @IBOutlet weak var reportBtnOutlet: UIButton!
    @IBOutlet weak var imageContent: UIImageView!
    @IBOutlet weak var openPdfBtn: UIButton!
    @IBOutlet weak var commentTextHeight: NSLayoutConstraint!
    
    // MARK: - Variables
    var commntIdForReport: Int?
    var deleteHandelr: ActionClouser?
    var reportHandler: ActionClouser?
    var openPdfHandler: ActionClouser?
    var openIMageHandler: ActionClouser?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        reportBtnOutlet.setTitle("report".localized, for: .normal)
        openPdfBtn.setTitle("Open Pdf".localized, for: .normal)
        userImage.layer.cornerRadius = userImage.frame.height/2
        imageContent.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped)))


    }
    // MARK: HERE
    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        openIMageHandler?()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }
    @IBAction func reportComment(_ sender: Any) {
        reportHandler?()
        reportBtnOutlet.isHidden = true
    }
    @IBAction func deleteComment(_ sender: UIButton) {
        deleteHandelr?()
        
    }
    @IBAction func openPdfAction(_ sender: Any) {
        openPdfHandler?()
    }
    
    // MARK: Cell Configure
    func cellConfigure(item: Comment){
        userNameComment.text = item.user?.name
        date.text = item.createdAt
        userImage.kf.setImage(with: URL(string: item.user?.photo ?? ""),placeholder: UIImage(named: "1276px-Placeholder_view_vector.svg"))
        if item.type == "image"{
            imageContent.kf.setImage(with: URL(string: item.comment ?? ""),placeholder: UIImage(named: "1276px-Placeholder_view_vector.svg"))
            commentView.isHidden = true
            openPdfBtn.isHidden = true
            
            
        }else if item.type == "text"{
            commentView.text = item.comment
            commentView.isHidden = false
            openPdfBtn.isHidden = true
        }
        else{
            commentView.isHidden = true
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
            
        }else{
            self.reportBtnOutlet.isHidden = true
        }
    }
    
}
