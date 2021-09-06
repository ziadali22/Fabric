//
//  changePasswordVC.swift
//  Fabric
//
//  Created by ziad on 30/08/2021.
//

import UIKit
import SkyFloatingLabelTextField
class changePasswordVC: UIViewController {

    @IBOutlet weak var saveChangesBtn: UIButton!
    @IBOutlet weak var passwordTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var confirmPasswordTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var DotView: UIView!
    
    var phone: String?
    var code: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        DotView.addDashBorder(color: .white, cornerRadius: 3)
    }
    func validateFields()  {
        guard let password = passwordTextField.text , !password.isEmpty else { return self.showMessage(sub: "check valid password ".localized) }
        
        guard let confirmPassword = confirmPasswordTextField.text , !confirmPassword.isEmpty else { return self.showMessage(sub: "check valid confirm passwrod".localized) }
        if password != confirmPassword {
            return self.showMessage(sub: "password and confirm password don't match")
        }else{
        changePasswordRequest()
        }
    }

    @IBAction func saveChangesButton(_ sender: Any) {
        validateFields()
    }
    
    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
