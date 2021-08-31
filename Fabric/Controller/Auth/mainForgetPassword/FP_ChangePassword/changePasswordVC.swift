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
    func validateFields() -> String? {
        
        // validate the fields
        if passwordTextField.text!.isEmpty || confirmPasswordTextField.text!.isEmpty {
            return "Please fill in all fields"
    }
        else if passwordTextField.text != confirmPasswordTextField.text {
            return "please the passwords not correct "
        }

        return nil
    }
    

    @IBAction func saveChangesButton(_ sender: Any) {
        let err = validateFields()
        if err != nil{
            showMessage(sub: "Wrong Data".localized)
        }
        else{
            apiRequest()
        }
    }
    
    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
