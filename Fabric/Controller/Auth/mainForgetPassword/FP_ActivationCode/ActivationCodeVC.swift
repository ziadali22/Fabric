//
//  ActivationCodeVC.swift
//  Fabric
//
//  Created by ziad on 30/08/2021.
//

import UIKit

class ActivationCodeVC: UIViewController {

    //MARK: - outlets
    @IBOutlet weak var activateBtn: UIButton!
    @IBOutlet weak var FirstTextField: UITextField!
    @IBOutlet weak var SecondTextField: UITextField!
    @IBOutlet weak var ThirdTextField: UITextField!
    @IBOutlet weak var FourthTextField: UITextField!
    @IBOutlet weak var DotView: UIView!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var sendAgainTitle: UIButton!
    @IBOutlet weak var backBtnTitle: UIButton!
    
    //MARK: - variables
    var phone: String?
    var code: String?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // localization
        backBtnTitle.setImage(UIImage(named: "arrow.left".localized), for: .normal)
        sendAgainTitle.setTitle("Send Again".localized, for: .normal)
        phoneLabel.text = phone
        DotView.addDashBorder(color: .white, cornerRadius: 3)
        // shaping the rectangle text field
        customizeTextFieldBorder(attr: FirstTextField)
        customizeTextFieldBorder(attr: SecondTextField)
        customizeTextFieldBorder(attr: ThirdTextField)
        customizeTextFieldBorder(attr: FourthTextField)
        
        // this function for one number will be in the text field and then the indicator will go to the another text field
        setUpTextFiled()
    }
    func customizeTextFieldBorder(attr: UITextField) {
        attr.layer.borderColor = UIColor.white
            .cgColor
        attr.layer.cornerRadius = 3
        attr.layer.borderWidth = 1.5
    }
    
    // MARK: - validation
    func validateFields()  {
        
        guard let first = FirstTextField.text , !first.isEmpty else { return self.showMessage(sub: "check valid first digit".localized) }
        guard let second = SecondTextField.text , !second.isEmpty else { return self.showMessage(sub: "check valid second digit".localized) }
        guard let third = ThirdTextField.text , !third.isEmpty else { return self.showMessage(sub: "check valid third digit".localized) }
        guard let fourth = FourthTextField.text , !fourth.isEmpty else { return self.showMessage(sub: "check valid fourth digit".localized) }
        
        // check validation for text fields and then make network request
        activationCodeRequest()
        
    }

    
    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ChangePassword(_ sender: Any) {
        validateFields()
    }
    func succes() {
        // when request network sucess then go to the change passsword screen
        let vc = storyboard?.instantiateViewController(identifier: "changePassword") as! changePasswordVC
        vc.modalPresentationStyle = .fullScreen
        vc.phone = phone
        vc.code = code
        present(vc, animated: true, completion: nil)
    }
    
}
