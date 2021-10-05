//
//  setPlaceHolder+EXT.swift
//  Fabric
//
//  Created by ziad on 27/09/2021.
//

import Foundation
import UIKit
extension AddCommentPopUpViewController: UITextViewDelegate{
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if comntText.textColor == UIColor.lightGray {
            comntText.text = nil
            comntText.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if comntText.text.isEmpty {
            comntText.text = "Type your comment here".localized
            comntText.textColor = UIColor.lightGray
        }
    }
    
}
