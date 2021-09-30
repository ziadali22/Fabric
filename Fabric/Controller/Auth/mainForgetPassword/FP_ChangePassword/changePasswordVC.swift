//
//  changePasswordVC.swift
//  Fabric
//
//  Created by ziad on 30/08/2021.
//

import UIKit
import SkyFloatingLabelTextField
class changePasswordVC: UIViewController {

    // MARK: - outlets
    @IBOutlet weak var saveChangesBtn: UIButton!
    @IBOutlet weak var passwordTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var confirmPasswordTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var DotView: UIView!
    @IBOutlet weak var backBtnTitle: UIButton!
    // MARK: - variables
    var phone: String?
    var code: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // localization
        backBtnTitle.setImage(UIImage(named: "arrow.left".localized), for: .normal)
        passwordTextField.placeholder = "Phone Number".localized
        confirmPasswordTextField.placeholder = "Confirm".localized
        DotView.addDashBorder(color: .white, cornerRadius: 3)
    }
    // MARK: - validation
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
