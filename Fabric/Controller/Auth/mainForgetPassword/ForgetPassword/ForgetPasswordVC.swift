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
    func validateFields() -> String? {
        
        // validate the fields
        if phoneNumberTextField.text!.isEmpty{
            return "Please fill in all fields"
    }
        return nil
    }
    
    @IBAction func codeActivation(_ sender: Any) {
        let err = validateFields()
        if err != nil {
            showMessage(sub: "Wrong Data".localized)
        }else{
            apiRequest()
            
        }
    }
    func success(){
        
        let vc = storyboard?.instantiateViewController(identifier: "codeActivate") as! ActivationCodeVC
        vc.phone = phoneNumberTextField.text
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    
}
