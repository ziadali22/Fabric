//
//  CustomizeTextField.swift
//  Fabric
//
//  Created by ziad on 29/08/2021.
//

import Foundation
import UIKit
class CustomTextAndButton {
    static func styleTextField(_ textfield:UITextField) {
        
    
        
        textfield.layer.borderWidth = 2
        textfield.layer.cornerRadius = textfield.frame.height/2
        textfield.layer.borderColor = UIColor.white.cgColor
        
        
    }
    static func styleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        //button.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        button.layer.cornerRadius = 3
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.tintColor = UIColor.white
        
    }
}

func useItToApplyChangesInTextField(attr:UITextField) {
    CustomTextAndButton.styleTextField(attr)
    
}

func useItToApplyChangesInButton(btn: UIButton){
    CustomTextAndButton.styleFilledButton(btn)
}
