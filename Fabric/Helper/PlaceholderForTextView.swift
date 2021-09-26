//
//  PlaceholderForTextView.swift
//  Fabric
//
//  Created by ziad on 24/09/2021.
//

import Foundation
import UIKit
class PlaceHolder: UITextView, UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }


    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Placeholder"
            textView.textColor = UIColor.lightGray
        }
    }

}
