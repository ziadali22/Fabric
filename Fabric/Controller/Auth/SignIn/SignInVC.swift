//
//  SignInVC.swift
//  Fabric
//
//  Created by ziad on 29/08/2021.
//

import UIKit
import SkyFloatingLabelTextField

class SignInVC: UIViewController {
    
    @IBOutlet weak var DotView: UIView!
    
    @IBOutlet weak var phoneNumberTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var PasswordTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var loginBtn: LoadingButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DotView.addDashBorder(color: .white, cornerRadius: 3)
        
        

    }
    func validateFields() -> String? {
        
        // validate the fields
        if phoneNumberTextField.text!.isEmpty ||
            PasswordTextField.text!.isEmpty {
            return "Please fill in all fields"
    }
        return nil
    }
    
    

    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func forgetPassword(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "forgetPassword") as! ForgetPasswordVC
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    @IBAction func loginButton(_ sender: Any) {
        let err = validateFields()
        if err != nil {
            showMessage(sub: "Wrong Data".localized)
        }else{
            apiRequest()
        }
    }
    
    func showError(_ message:String)  {
        print("error")
       
    }
    

}
