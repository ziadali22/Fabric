//
//  ExtField.swift
//  sabeelUser
//
//  Created by Abulrahman mohsen on 3/21/20.
//  Copyright © 2020 Abulrahman mohsen. All rights reserved.
//

import UIKit
extension UITextField {
    
    
    //======layer===============

    @IBInspectable var placeColor : UIColor {
        get{
            return UIColor.init(red: 199, green: 199, blue: 205, alpha: 1.0)
        }
        set{
            attributedPlaceholder = NSAttributedString(string: placeholder != nil ? placeholder! : "", attributes: [NSAttributedString.Key.foregroundColor : newValue])
        }
    }
 
    @IBInspectable var BorderWidth : CGFloat {
        get{
            return layer.borderWidth
        }
        set{
            layer.borderWidth = newValue
        }
    }
    
    //=====padding==================
    
    func setPadding(mount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: mount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
        self.rightView = paddingView
        self.rightViewMode = .always

    }
   
    
    //========shadowLine===========

    func setBottomLine(txtBackground : UIColor ,bottomColor : UIColor) {
        
        self.borderStyle = .none
        self.layer.backgroundColor = txtBackground.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = bottomColor.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }

   
    

}

class TextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
