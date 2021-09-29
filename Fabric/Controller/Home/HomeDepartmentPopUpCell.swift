//
//  HomeDepartmentPopUpCell.swift
//  Fabric
//
//  Created by ziad on 22/09/2021.
//

import UIKit


class HomeDepartmentPopUpCell: UICollectionViewCell {
    // MARK: - Outlet
    @IBOutlet weak var departmentsLabel: UILabel!
    // MARK: - Variables
    var addToArray: ActionClouser?
    var removeFromArray: ActionClouser?
    
    // MARK: - Cell Selected
    override var isSelected: Bool {
        didSet {
            if isSelected == true{
                departmentsLabel.textColor = .white
                addToArray?()
            }
            else{
                departmentsLabel.textColor = .systemGreen
                removeFromArray?()
            }
        }
    }
    
}
