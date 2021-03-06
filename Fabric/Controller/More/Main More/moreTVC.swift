//
//  moreTVC.swift
//  Fabric
//
//  Created by ziad on 05/09/2021.
//

import UIKit

class moreTVC: UITableViewCell {

// MARK: - Outlet
    @IBOutlet weak var TitleImage: UIImageView!
    @IBOutlet weak var TitleTxt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // this line for when click table cell it will not be highlited with gray color 
        selectionStyle = .none
        
    }
    func configure(_ image: String, _ title: String){
        TitleImage.image = UIImage(named: image)
        TitleTxt.text = title
    }
}
