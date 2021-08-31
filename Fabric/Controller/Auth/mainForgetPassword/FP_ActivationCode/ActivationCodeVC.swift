//
//  ActivationCodeVC.swift
//  Fabric
//
//  Created by ziad on 30/08/2021.
//

import UIKit

class ActivationCodeVC: UIViewController {

    @IBOutlet weak var activateBtn: UIButton!
    @IBOutlet weak var FirstTextField: UITextField!
    @IBOutlet weak var SecondTextField: UITextField!
    @IBOutlet weak var ThirdTextField: UITextField!
    @IBOutlet weak var FourthTextField: UITextField!
    @IBOutlet weak var DotView: UIView!
    @IBOutlet weak var phoneLabel: UILabel!
    
    
    var phone: String?
    var code: String?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        phoneLabel.text = phone
        DotView.addDashBorder(color: .white, cornerRadius: 3)
        customizeTextFieldBorder(attr: FirstTextField)
        customizeTextFieldBorder(attr: SecondTextField)
        customizeTextFieldBorder(attr: ThirdTextField)
        customizeTextFieldBorder(attr: FourthTextField)
        setUpTextFiled()
        
        
    }
    func customizeTextFieldBorder(attr: UITextField) {
        attr.layer.borderColor = UIColor.white
            .cgColor
        attr.layer.cornerRadius = 3
        attr.layer.borderWidth = 1.5
    }
    func validateFields() -> String? {
        
        // validate the fields
        if FirstTextField.text!.isEmpty || SecondTextField.text!.isEmpty || ThirdTextField.text!.isEmpty || FourthTextField.text!.isEmpty{
            return "Please fill in all fields".localized
        }
        return nil
    }

    
    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ChangePassword(_ sender: Any) {
        let err = validateFields()
        if err != nil {
            showMessage(sub: "Wrong Data".localized)
        }else{
            apiRequest()
            
        }
    }
    func succes() {
        let vc = storyboard?.instantiateViewController(identifier: "changePassword") as! changePasswordVC
        vc.modalPresentationStyle = .fullScreen
        vc.phone = phone
        vc.code = code
        present(vc, animated: true, completion: nil)
    }
    
}
