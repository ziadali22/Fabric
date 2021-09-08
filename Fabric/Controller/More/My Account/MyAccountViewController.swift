//
//  MyAccountViewController.swift
//  Fabric
//
//  Created by ziad on 07/09/2021.
//

import UIKit
import SkyFloatingLabelTextField
class MyAccountViewController: UIViewController {


    @IBOutlet weak var dotView: UIView!
    @IBOutlet weak var nameField: SkyFloatingLabelTextField!
    @IBOutlet weak var phoneNumber: SkyFloatingLabelTextField!

    @IBOutlet weak var emailField: SkyFloatingLabelTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameField.text = UserDataActions.getUserModel()?.name
        self.phoneNumber.text = UserDataActions.getUserModel()?.phone
        self.emailField.text = UserDataActions.getUserModel()?.email
        
        dotView.addDashBorder(color: .white, cornerRadius: 3)
    }
    
    @IBAction func popUpChangePassword(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "popup") as! PopUPChangePasswordVC
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
    

}
