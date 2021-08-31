//
//  textFieldStyle.swift
//  sabeelUser
//
//  Created by Abulrahman mohsen on 3/21/20.
//  Copyright © 2020 Abulrahman mohsen. All rights reserved.
//

import UIKit
class StyleTextField : TextField {
        
    func applyTextFieldStyle() {
        
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        applyTextFieldStyle()
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        applyTextFieldStyle()
    }
    
}

  

 class StyleTextFieldLineWhite: StyleTextField {
    override func applyTextFieldStyle() {
 
        self.borderStyle = .none
        self.addLine(position: .LINE_POSITION_BOTTOM, color: .white, width: 1)

    }
}

 class StyleTextFieldLineGray: StyleTextField {
    override func applyTextFieldStyle() {
 
        self.borderStyle = .none
        self.addLine(position: .LINE_POSITION_BOTTOM, color: .lightGray, width: 1)

    }
}
