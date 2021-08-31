//
//  ExtButton.swift
//  sabeelUser
//
//  Created by Abulrahman mohsen on 3/21/20.
//  Copyright © 2020 Abulrahman mohsen. All rights reserved.
//

import UIKit
//@IBDesignable
extension UIButton {


    @IBInspectable var borderWidth : CGFloat {
        get{
            return layer.borderWidth
        }
        set{
        self.layer.borderWidth = newValue
        }
    }

    

}
