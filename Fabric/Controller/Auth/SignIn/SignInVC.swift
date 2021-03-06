//
//  SignInVC.swift
//  Fabric
//
//  Created by ziad on 29/08/2021.
//

import UIKit
import SkyFloatingLabelTextField

class SignInVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var DotView: UIView!
    @IBOutlet weak var phoneNumberTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var PasswordTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var dontHaveAccountTitle: UIButton!
    @IBOutlet weak var loginBtn: LoadingButton!
    @IBOutlet weak var backBtnTitle: UIButton!
    @IBOutlet weak var loginTitle: UILabel!
    @IBOutlet weak var forgetPasswordTiltle: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // localization
        loginBtn.titleLabel?.font = UIFont(name: "PNU-Medium", size: 16)
        loginTitle.font = UIFont(name: "PNU-Medium", size: 16)
        forgetPasswordTiltle.titleLabel?.font = UIFont(name: "PNU-Medium", size: 13)
        dontHaveAccountTitle.titleLabel?.font = UIFont(name: "PNU-Medium", size: 14)
        phoneNumberTextField.font = UIFont(name:"PNU-Medium", size: 14)
        PasswordTextField.font = UIFont(name:"PNU-Medium", size: 14)
        dontHaveAccountTitle.titleLabel?.font = UIFont(name:"PNU-Medium", size: 14)
        
        phoneNumberTextField.placeholder = "Phone Number".localized
        PasswordTextField.placeholder = "Password".localized
        dontHaveAccountTitle.setTitle("don't have an account ?".localized, for: .normal)
        if Language.isEnglish() == true{
            backBtnTitle.setImage(UIImage(systemName:"arrow.left"), for: .normal)
        }else{
            backBtnTitle.setImage(UIImage(systemName:"arrow.right"), for: .normal)
        }
        DispatchQueue.main.async {
            self.DotView.addDashBorder(color: .white, cornerRadius: 3)
        }
    }
    // MARK: - Validation
    func validateFields(){
        guard let phone = phoneNumberTextField.text , !phone.isEmpty else { return self.showMessage(sub: "check valid phone number".localized) }
        guard let password = PasswordTextField.text , !password.isEmpty else { return self.showMessage(sub: "check valid password".localized) }

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
    @IBAction func havntAccount(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "signup") as! SignUpVC
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
}
