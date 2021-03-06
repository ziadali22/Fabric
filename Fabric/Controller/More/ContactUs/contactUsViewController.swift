//
//  contactUsViewController.swift
//  Fabric
//
//  Created by ziad on 07/09/2021.
//

import UIKit
import SkyFloatingLabelTextField
class contactUsViewController: UIViewController, UITextViewDelegate {

    // MARK: - Outlet
    @IBOutlet weak var contactUsTitle: UILabel!
    @IBOutlet weak var nameTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var phoneNumb: SkyFloatingLabelTextField!
    @IBOutlet weak var emailText: SkyFloatingLabelTextField!
    @IBOutlet weak var dotView: UIView!
    
    @IBOutlet weak var sendBtn: LoadingButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        contactUsTitle.text = "Contact Us".localized
        nameTxtField.placeholder = "Name".localized
        phoneNumb.placeholder = "Phone Number".localized
        emailText.placeholder = "Email".localized
        
        nameTxtField.font = UIFont(name: "PNU-Medium", size: 14)
        phoneNumb.font = UIFont(name: "PNU-Medium", size: 14)
        emailText.font = UIFont(name: "PNU-Medium", size: 14)
        
        sendBtn.setTitle("Send".localized, for: .normal)
        DispatchQueue.main.async {
            self.textView.addDashBorder(color: .green, cornerRadius: 3)
            self.dotView.addDashBorder(color: .white, cornerRadius: 3)
        }
        textView.delegate = self
        textView.text = "Type your message here".localized
        textView.textColor = UIColor.lightGray
    }
    // MARK: - Validation
    func validationField(){
        guard let name = nameTxtField.text, !name.isEmpty else { return self.showMessage(sub: "check valid name") }
        guard let email = emailText.text, !email.isEmpty else { return self.showMessage(sub: "check valid email") }
        guard let phone = phoneNumb.text, !phone.isEmpty else { return self.showMessage(sub: "check valid phone") }
        guard let TextView = textView.text  , !TextView.isEmpty && TextView == "Type your message here".localized else { return self.showMessage(sub: "check valid content ") }
        contactUsRequest()
    }
    @IBAction func send(_ sender: Any) {
        validationField()
    }
    

}
