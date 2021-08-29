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
        DotView.addDashBorder(color: .white, cornerRadius: 3)
    }
    
    
}
