//
//  ForgetPasswordVC.swift
//  Fabric
//
//  Created by ziad on 30/08/2021.
//

import UIKit
import SkyFloatingLabelTextField
class ForgetPasswordVC: UIViewController {

    @IBOutlet weak var sendCodeBtn: UIButton!
    @IBOutlet weak var phoneNumberTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var DotView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DotView.addDashBorder(color: .white, cornerRadius: 3)
    }
    

    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    func validateFields() {
        // validate the fields
        guard let phone = phoneNumberTextField.text , !phone.isEmpty else { return self.showMessage(sub: "check valid phone number".localized) }
        forgetPasswordRequest()

    }
    
    @IBAction func codeActivation(_ sender: Any) {
        validateFields()
    }
    func success(){
        // after you put the number i will go to the (OTP) screen
        let vc = storyboard?.instantiateViewController(identifier: "codeActivate") as! ActivationCodeVC
        vc.phone = phoneNumberTextField.text
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    
}
