//
//  exTextView.swift
//  sabeelUser
//
//  Created by Abulrahman mohsen on 3/21/20.
//  Copyright © 2020 Abulrahman mohsen. All rights reserved.
//

import UIKit
extension UITextView {
    
    func calculateHeightForTxt() -> CGRect{
        let size = CGSize(width: 200, height: 1000)
        let options  = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        return NSString(string: self.text).boundingRect(with: size, options: options, attributes:[NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)], context: nil)
    }
}
