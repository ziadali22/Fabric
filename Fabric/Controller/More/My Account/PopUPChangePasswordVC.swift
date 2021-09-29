//
//  PopUPChangePasswordVC.swift
//  Fabric
//
//  Created by ziad on 07/09/2021.
//

import UIKit
import SkyFloatingLabelTextField
class PopUPChangePasswordVC: UIViewController {
    // MARK: - Outlet
    @IBOutlet weak var saveBtn: LoadingButton!
    @IBOutlet weak var password: SkyFloatingLabelTextField!
    @IBOutlet weak var confirmPassword: SkyFloatingLabelTextField!
    @IBOutlet weak var dotView: UIView!
    // localization
    @IBOutlet weak var changePasswordTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // localization
        changePasswordTitle.text = "Change Password".localized
        password.placeholder = "New Password".localized
        confirmPassword.placeholder = "Confirm Password".localized
        saveBtn.setTitle("Save".localized, for: .normal)
        dotView.addDashBorder(color: .white, cornerRadius: 3)
    }
    
    @IBAction func dismissBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    // MARK: - Validation
    func validateFields(){
        guard let password = password.text , !password.isEmpty else { return self.showMessage(sub: "check valid Password".localized) }
        guard let confirmPassword = confirmPassword.text , !confirmPassword.isEmpty else { return self.showMessage(sub: "check Confirm password".localized) }
        // network
        changePasswordRequest()
    }
    @IBAction func savePasswordChange(_ sender: Any) {
        validateFields()
    }
    
}
