//
//  PlaceHolder.swift
//  Fabric
//
//  Created by ziad on 27/09/2021.
//

import Foundation
import UIKit

extension AddPosts:  UITextViewDelegate{
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if commentText.textColor == UIColor.lightGray {
            commentText.text = nil
            commentText.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if commentText.text.isEmpty {
            commentText.text = "Type your comment here".localized
            commentText.textColor = UIColor.lightGray
        }
    }
    
}


