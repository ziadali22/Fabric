//
//  MyAccountViewController.swift
//  Fabric
//
//  Created by ziad on 07/09/2021.
//

import UIKit
import SkyFloatingLabelTextField
class MyAccountViewController: UIViewController {
    
    // MARK: - variables
    lazy var imageInstance = imagePickerHelper(viewController: self)
    var profileImage = [UploadData]()
    
    // MARK: - outlet
    @IBOutlet weak var dotView: UIView!
    @IBOutlet weak var imageDotView: UIView!
    @IBOutlet weak var nameField: SkyFloatingLabelTextField!
    @IBOutlet weak var phoneNumber: SkyFloatingLabelTextField!
    @IBOutlet weak var emailField: SkyFloatingLabelTextField!

    @IBOutlet weak var userImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameField.text = UserDataActions.getUserModel()?.name
        self.phoneNumber.text = UserDataActions.getUserModel()?.phone
        self.emailField.text = UserDataActions.getUserModel()?.email
        
        dotView.addDashBorder(color: .white, cornerRadius: 3)
        imageDotView.addDashBorder(color: .white, cornerRadius: 3)
    }
    
    @IBAction func popUpChangePassword(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "popup") as! PopUPChangePasswordVC
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func changeUserImage(_ sender: Any) {
        imageInstance.imageSelected = {[weak self] selectedImage in
            guard let self = self else {return}
            if let image = selectedImage.jpegData(compressionQuality: 0.1) {
                self.profileImage.append(UploadData(data: image, name: "image", type: "image"))
            }
            self.userImage.image = selectedImage
        }

    }
    @IBAction func sendChanges(_ sender: Any) {
        updateUserProfielRequest(name: nameField.text ?? "", phone: phoneNumber.text ?? "", email: emailField.text ?? "")
    }
    
    func updateUserProfielRequest(name: String, phone: String,email: String){
        AuthRequestRouter.UpdateProfile(name: name, phone: phone, email: email).send(BaseModel<User>.self,data: profileImage, then: handleResponseUpdateProfile)
    }
    var handleResponseUpdateProfile: HandleResponse<BaseModel<User>> {
        return { [weak self] (response) in
            guard let self = self else {return}
            switch response {
            case .failure(let error):
                self.showMessage(sub: error.localizedDescription)
            case .success(let model):
                if model.status{
                    guard let model = model.data else {return}
                    UserDataActions.cashUserModel(user: model)
                    self.navigationController?.popViewController(animated: true)
                    self.showMessage(sub: "profile updated succefully !".localized)
                }else{
                    guard let errorMsg = model.msg else{return}
                    self.showMessage(sub: errorMsg)
                }
                
            }
        }
    }


    

}
//        let url = "http://fabric.panorama-q.com/api/auth/profile"
//        let header = ["Authorization":"Berear\(UserDataActions.getUserModel()?.token ?? "")", "Accept": "application/json"]
//
//        let parameters = ["photo": "image"] as [String : Any]
//        AlamofireMultiPart.PostMultiWithModel(model: ValueModel.self, url: url, Images: nil, header: header, parameters: parameters, completion: handleResponse)
//
//        func handleResponse(result: ServerResponse<ValueModel>){
//
//            switch result {
//            case .failure(let error):
//                self.showMessage(sub: error?.localizedDescription)
//            case .success(let model):
//                if model.status{
//                    self.showMessage(sub: "Post Added Succefully !".localized)
//                }else{
//                    guard let errorMsg = model.msg else{return}
//                    self.showMessage(sub: errorMsg)
//                }
//
//            }
//        }
