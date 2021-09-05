//
//  moreTVC.swift
//  Fabric
//
//  Created by ziad on 05/09/2021.
//

import UIKit

class moreTVC: UITableViewCell {


    @IBOutlet weak var TitleImage: UIImageView!
    @IBOutlet weak var TitleTxt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    func configure(_ image: String, _ title: String){
        TitleImage.image = UIImage(named: image)
        TitleTxt.text = title
    }
}
