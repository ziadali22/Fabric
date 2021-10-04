//
//  SignUpCVC.swift
//  Fabric
//
//  Created by ziad on 29/08/2021.
//

import UIKit

class SignUpCVC: UICollectionViewCell {
    // MARK: - Outlet
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var labelButton: UILabel!
    // MARK: - Variables
    var deleteHandeler: ActionClouser?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        labelButton.font = UIFont(name: "PNU-Medium", size: 13)
    }
    
    @IBAction func deleteAction(_ sender: Any) {
        deleteHandeler?()
    }
    
}
