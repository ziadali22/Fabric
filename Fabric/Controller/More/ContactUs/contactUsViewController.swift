//
//  contactUsViewController.swift
//  Fabric
//
//  Created by ziad on 07/09/2021.
//

import UIKit
import SkyFloatingLabelTextField
class contactUsViewController: UIViewController {


    @IBOutlet weak var nameTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var phoneNumb: SkyFloatingLabelTextField!
    @IBOutlet weak var emailText: SkyFloatingLabelTextField!
    @IBOutlet weak var dotView: UIView!
    
    @IBOutlet weak var sendBtn: LoadingButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            self.textView.addDashBorder(color: .green, cornerRadius: 3)
            self.dotView.addDashBorder(color: .green, cornerRadius: 3)
        }


    }
    func validationField(){
        guard let name = nameTxtField.text, !name.isEmpty else { return self.showMessage(sub: "check valid name") }
        guard let email = emailText.text, !email.isEmpty else { return self.showMessage(sub: "check valid email") }
        guard let phone = phoneNumb.text, !phone.isEmpty else { return self.showMessage(sub: "check valid phone") }
        guard let textView = textView.text, !textView.isEmpty else { return self.showMessage(sub: "check valid content ") }
        contactUsRequest()
        
    }
    @IBAction func send(_ sender: Any) {
        validationField()
    }
    

}
