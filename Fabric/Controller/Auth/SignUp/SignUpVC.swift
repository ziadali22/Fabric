//
//  SignUpVC.swift
//  Fabric
//
//  Created by ziad on 29/08/2021.
//

import UIKit
import SkyFloatingLabelTextField
class SignUpVC: UIViewController {
    @IBOutlet weak var collectionViwe: UICollectionView!
    
    @IBOutlet weak var DotView: UIView!
    @IBOutlet weak var nameTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var phoneNumberTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var confirmTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var emailTextField: SkyFloatingLabelTextField!
    
    
    let images = ["Group 509","Group 509","Group 509"]
    let label = ["physics", "science", "math"]
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViwe.dataSource = self
        collectionViwe.delegate = self
        
        DotView.addDashBorder(color: .white, cornerRadius: 3)
    }
    
    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

        
    @IBAction func signUpButton(_ sender: Any) {
        validatation()
        
    }
    func validatation(){
        guard let name = nameTextField.text , !name.isEmpty else { return print("error") }
        guard let name = phoneNumberTextField.text , !name.isEmpty else { return print("error") }
        guard let name = emailTextField.text , !name.isEmpty else { return print("error") }
        guard let name = passwordTextField.text , !name.isEmpty else { return print("error") }
        guard let name = confirmTextField.text , !name.isEmpty else { return print("error") }
        
    }
    
}
extension SignUpVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SignUpCVC
        cell.contentView.layer.cornerRadius = 10
        cell.labelButton.text = "name"
        return cell
    }
    
    
}
