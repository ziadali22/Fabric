//
//  SignUpVC.swift
//  Fabric
//
//  Created by ziad on 29/08/2021.
//

import UIKit
import SkyFloatingLabelTextField
class SignUpVC: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var collectionViwe: UICollectionView!
    @IBOutlet weak var DotView: UIView!
    @IBOutlet weak var nameTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var phoneNumberTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var confirmTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var emailTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var categoryTxt: SkyFloatingLabelTextField!
    @IBOutlet weak var collectionHeight: NSLayoutConstraint!
    @IBOutlet weak var backBtnTitle: UIButton!
    
    // MARK: - Variables
    var categoryData: [CategoryModel]?
    let pickerView = ToolbarPickerView()
    var selectedCategory = [CategoryModel]()
    var categoryId = [Int]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // localization
        signUpBtn.titleLabel?.font = UIFont(name: "PNU-Medium", size: 16)
        categoryTxt.font = UIFont(name:"PNU-Medium", size: 14)
        nameTextField.font = UIFont(name:"PNU-Medium", size: 14)
        phoneNumberTextField.font = UIFont(name:"PNU-Medium", size: 14)
        emailTextField.font = UIFont(name:"PNU-Medium", size: 14)
        passwordTextField.font = UIFont(name:"PNU-Medium", size: 14)
        confirmTextField.font = UIFont(name:"PNU-Medium", size: 14)
        
        if Language.isEnglish() == true{
            backBtnTitle.setImage(UIImage(systemName:"arrow.left"), for: .normal)
        }else{
            backBtnTitle.setImage(UIImage(systemName:"arrow.right"), for: .normal)
        }
        
        nameTextField.placeholder = "Name".localized
        phoneNumberTextField.placeholder = "Phone Number".localized
        passwordTextField.placeholder = "Password".localized
        confirmTextField.placeholder = "Confirm Password".localized
        emailTextField.placeholder = "Email".localized
        
        getCategoriesApi()
        collectionViwe.dataSource = self
        collectionViwe.delegate = self
        DotView.addDashBorder(color: .white, cornerRadius: 3)
        collectionHeight.constant = 0
        setUpPicker()
    }

    //PickerView
    func setUpPicker(){
        self.categoryTxt.inputView = self.pickerView
        self.categoryTxt.inputAccessoryView = self.pickerView.toolbar
        self.categoryTxt.placeholder = "Choose Department".localized
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        self.pickerView.toolbarDelegate = self
        self.pickerView.reloadAllComponents()
    }
    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func signUpButton(_ sender: Any) {
        validatation()
    }

    // MARK: - Validation
    func validatation(){
        guard let name = nameTextField.text , !name.isEmpty else { return self.showMessage(sub: "check valid name".localized) }
        guard let phone = phoneNumberTextField.text , !phone.isEmpty else { return self.showMessage(sub: "check valid phone".localized) }
        guard let email = emailTextField.text , !email.isEmpty else { return self.showMessage(sub: "email valid phone".localized) }
        guard let password = passwordTextField.text , !password.isEmpty else { return self.showMessage(sub: "check valid password".localized) }
        guard let confirm = confirmTextField.text , !confirm.isEmpty else { return self.showMessage(sub: "check valid confirm password".localized)
        }
        if password != confirm {
            return self.showMessage(sub: "password and confirm password don't match")
        }else{
            
            for  i in selectedCategory {
                if let id = i.id{
                    categoryId.append(id)
                    print(categoryId)
                }
            }

            signUpRequest()
        }
        
    }

    
}

// MARK: - PickerView
extension SignUpVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SignUpCVC
        cell.contentView.layer.cornerRadius = 10
        cell.labelButton.text = selectedCategory[indexPath.row].name
        cell.deleteHandeler = {
            self.selectedCategory.remove(at: indexPath.row)
            self.collectionViwe.reloadData()
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = selectedCategory[indexPath.row].name.calculateHeightForString().width 
        return CGSize(width: width + 10 ,height: 40)
        }

    
}
