//
//  PlaceHolder+EXT.swift
//  Fabric
//
//  Created by ziad on 27/09/2021.
//

import Foundation
import UIKit
extension contactUsViewController{
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Type your message here".localized
            textView.textColor = UIColor.lightGray
        }
    }

}
