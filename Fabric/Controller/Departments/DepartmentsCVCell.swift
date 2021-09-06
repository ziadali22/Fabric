//
//  DepartmentsCVCell.swift
//  Fabric
//
//  Created by ziad on 02/09/2021.
//

import UIKit

class DepartmentsCVCell: UICollectionViewCell {
    
    @IBOutlet weak var DepartmentTxt: UILabel!
    
    @IBOutlet weak var followBtn: UIButton!
    
    @IBOutlet weak var dotView: UIView!
    
    var followHandeler: ActionClouser?
    
    
    func DotViewFunc()  {
        DispatchQueue.main.async{
            self.dotView.addDashBorder(color: AppColor.gren, cornerRadius: 3)
    }
        

    }
    @IBAction func followclick(_ sender: Any) {
        followHandeler?()
    }
    
    
    func configureCell(item: CategoryModel){
        DepartmentTxt.text = item.name
        
        if item.isFollowed == true{
            followBtn.setTitle("un follow", for: .normal)
        }else{
            followBtn.setTitle("follow", for: .normal)
        }
       
    }
}
