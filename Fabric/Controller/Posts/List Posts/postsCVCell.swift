//
//  postsCVCell.swift
//  Fabric
//
//  Created by ziad on 05/09/2021.
//

import UIKit

class postsCVCell: UICollectionViewCell {
    // MARK: - Outlet
    @IBOutlet weak var DepartmentTitle: UILabel!
    @IBOutlet weak var commentBtn: UIButton!
    @IBOutlet weak var commentCount: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var deletePostOutlet: UIButton!
    // MARK: - Variables
    var deletePostClosure: ActionClouser?
    var hideDeleteBtn: ActionClouser?
    override func awakeFromNib() {
        super.awakeFromNib()
        commentBtn.setTitle("Comment".localized, for: .normal)
    }
    
    @IBAction func deletePost(_ sender: Any) {
        deletePostClosure?()
    }

    // MARK: - Cell Configure
    func postsCvonfigure(item: Item){
        cellImage.kf.setImage(with: URL(string: item.content ?? "") )
        DepartmentTitle.text = item.category?.name
        commentCount.text = String(item.comments?.count ?? 0)
        date.text = item.createdAt
        
    }

    
    
}
