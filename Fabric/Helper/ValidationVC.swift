//
//  ValidationVC.swift
//  Fabric
//
//  Created by ziad on 31/08/2021.
//

import Foundation
import UIKit
extension ActivationCodeVC: UITextFieldDelegate {
    func setUpTextFiled(){
        FirstTextField.delegate = self
        SecondTextField.delegate = self
        ThirdTextField.delegate = self
        FourthTextField.delegate = self

    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // On inputing value to textfield
        if ((textField.text?.count)! < 1  && string.count > 0){
            if(textField == FirstTextField)
            {
                SecondTextField.becomeFirstResponder()
            }
            if(textField == SecondTextField)
            {
                ThirdTextField.becomeFirstResponder()
            }
            if(textField == ThirdTextField)
            {
                FourthTextField.becomeFirstResponder()
            }


            textField.text = string
            return false
        }
        else if ((textField.text?.count)! >= 1  && string.count == 0){
            // on deleting value from Textfield
            if(textField == SecondTextField)
            {
                FirstTextField.becomeFirstResponder()
            }
            if(textField == ThirdTextField)
            {
                SecondTextField.becomeFirstResponder()
            }
            if(textField == FourthTextField)
            {
                ThirdTextField.becomeFirstResponder()
            }

            textField.text = ""
            return false
        }
        else if ((textField.text?.count)! >= 1  )
        {
            textField.text = string
            return false
        }
        return true
    }


}
