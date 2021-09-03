//
//  LoginOrSign.swift
//  Fabric
//
//  Created by ziad on 29/08/2021.
//

import UIKit

class LoginOrSign: UIViewController {

    @IBOutlet weak var DotView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        useItToApplyChangesInButton(btn: loginButton)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       
    }
    override func viewWillLayoutSubviews() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            self.DotView.addDashBorder(color: .white, cornerRadius: 3)
        }
       
    }
    @IBAction func loginButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "login") as! SignInVC
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
        
    }
    
    @IBAction func signupButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "signup") as! SignUpVC
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}
