//
//  LoginOrSign.swift
//  Fabric
//
//  Created by ziad on 29/08/2021.
//

import UIKit

class LoginOrSign: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var DotView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        useItToApplyChangesInButton(btn: loginButton)
        
       
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DotView.addDashBorder(color: .white, cornerRadius: 3)
    }
    //MARK: - Login
    @IBAction func loginButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "login") as! SignInVC
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
        
        
    }
    //MARK: - SignUp
    @IBAction func signupButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "signup") as! SignUpVC
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
}
