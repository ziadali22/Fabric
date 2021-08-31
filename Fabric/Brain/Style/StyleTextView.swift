//
//  StyleTextView.swift
//  sabeelUser
//
//  Created by Abulrahman mohsen on 3/21/20.
//  Copyright © 2020 Abulrahman mohsen. All rights reserved.
//
import UIKit
class StyleTextView: UITextView {
    
    let padding = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    
    func applyTextViewStyle() {
        self.contentInset = padding
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        applyTextViewStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        applyTextViewStyle()
    }
}
class StyleTextViewBorderGray: StyleTextView {
    override func applyTextViewStyle() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
    }
}
