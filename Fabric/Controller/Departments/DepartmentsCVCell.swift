//
//  DepartmentsCVCell.swift
//  Fabric
//
//  Created by ziad on 02/09/2021.
//

import UIKit

class DepartmentsCVCell: UICollectionViewCell {
    // MARK: - Outlet
    @IBOutlet weak var DepartmentTxt: UILabel!
    @IBOutlet weak var followBtn: UIButton!
    @IBOutlet weak var dotView: UIView!
    @IBOutlet weak var departemtnsIcon: UIImageView!
    
    // MARK: - Variables
    var followHandeler: ActionClouser?

    func DotViewFunc()  {
        DispatchQueue.main.async{
            self.DepartmentTxt.font = UIFont(name: "PNU-Bold", size: 16)
            self.dotView.addDashBorder(color: AppColor.gren, cornerRadius: 3)
        }
    }
    @IBAction func followclick(_ sender: Any) {
        followHandeler?()
    }
    // MARK: - Cell Configuration
    func configureCellForDepartment(item:CategoryModel){
        DepartmentTxt.text = item.name
        departemtnsIcon.kf.setImage(with: URL(string: item.logo ??  ""),placeholder: UIImage(named: "Group171"))
        if item.isFollowed == true {
            followBtn.setTitle("UnFollow".localized, for: .normal)
            
            followBtn.setTitleColor(.systemGreen , for: .normal)
        }else{
            followBtn.setTitle("Follow".localized, for: .normal)
            followBtn.setTitleColor(.gray , for: .normal)
        }
    }
    
    
    
}
