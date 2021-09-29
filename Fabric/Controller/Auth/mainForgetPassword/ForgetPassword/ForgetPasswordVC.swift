//
//  ForgetPasswordVC.swift
//  Fabric
//
//  Created by ziad on 30/08/2021.
//

import UIKit
import SkyFloatingLabelTextField
class ForgetPasswordVC: UIViewController {

    //MARK: - outlets
    @IBOutlet weak var sendCodeBtn: UIButton!
    @IBOutlet weak var phoneNumberTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var DotView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNumberTextField.placeholder = "Phone Number".localized
        DotView.addDashBorder(color: .white, cornerRadius: 3)
    }

    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func codeActivation(_ sender: Any) {
        validateFields()
    }
    
    //MARK: - validation
    func validateFields() {
        // validate the fields
        guard let phone = phoneNumberTextField.text , !phone.isEmpty else { return self.showMessage(sub: "check valid phone number".localized) }
        forgetPasswordRequest()
    }
}
