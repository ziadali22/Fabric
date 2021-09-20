//
//  SignInVC.swift
//  Fabric
//
//  Created by ziad on 29/08/2021.
//

import UIKit
import SkyFloatingLabelTextField

class SignInVC: UIViewController {
    // dotView
    @IBOutlet weak var DotView: UIView!
    // inputs Field
    @IBOutlet weak var phoneNumberTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var PasswordTextField: SkyFloatingLabelTextField!
    // login button
    @IBOutlet weak var loginBtn: LoadingButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // adding the dot border for button
        DispatchQueue.main.async {
            self.DotView.addDashBorder(color: .white, cornerRadius: 3)
        }

        
        
        

    }
    func validateFields(){
        
        // validate the fields
        guard let phone = phoneNumberTextField.text , !phone.isEmpty else { return self.showMessage(sub: "check valid phone number".localized) }
        guard let password = PasswordTextField.text , !password.isEmpty else { return self.showMessage(sub: "check valid password".localized) }
        // if you check the phone number and password then make network request and send me to the home screen
        signInRequest()
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
        validateFields()
    }
    
    func showError(_ message:String)  {
        print("error")
       
    }
    
    @IBAction func havntAccount(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "signup") as! SignUpVC
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
}
