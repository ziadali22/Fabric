//
//  MyAccountViewController.swift
//  Fabric
//
//  Created by ziad on 07/09/2021.
//

import UIKit
import Kingfisher
import SkyFloatingLabelTextField
class MyAccountViewController: UIViewController {
    
    // MARK: - variables
    var imagePicker : UIImage?
    var profileImage = [UploadData]()
    var uploadedImage : UploadData?
    // MARK: - outlet
    @IBOutlet weak var dotView: UIView!
    @IBOutlet weak var imageDotView: UIView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameField: SkyFloatingLabelTextField!
    @IBOutlet weak var phoneNumber: SkyFloatingLabelTextField!
    @IBOutlet weak var emailField: SkyFloatingLabelTextField!
    @IBOutlet weak var sendBtnOutlet: LoadingButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameField.text = UserDataActions.getUserModel()?.name
        self.phoneNumber.text = UserDataActions.getUserModel()?.phone
        self.emailField.text = UserDataActions.getUserModel()?.email
        
        dotView.addDashBorder(color: .white, cornerRadius: 3)
        imageDotView.addDashBorder(color: .white, cornerRadius: 3)
        userImage.kf.setImage(with: URL(string: (UserDataActions.getUserModel()?.photo)!))
    }
    
    @IBAction func popUpChangePassword(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "popup") as! PopUPChangePasswordVC
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func changeUserImage(_ sender: Any) {
        
        pickImage()

    }
    
    func pickImage(){
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    
    
    @IBAction func sendChanges(_ sender: Any) {
        sendBtnOutlet.showLoader()
        let header = ["Authorization":"Berear\(UserDataActions.getUserModel()?.token ?? "")", "Accept": "application/json"]
        let url  = "http://fabric.panorama-q.com/api/auth/profile"
        let parameters = ["_method": "put" ,"name": nameField.text ?? "","phone": phoneNumber.text ?? "","email":emailField.text ?? ""]
        if uploadedImage != nil{
            if let image = uploadedImage{
                let imageArr = [image]
                AlamofireMultiPart.PostMultiWithModel(model: BaseModel<User>.self, url: url, Images: imageArr, header: header, parameters: parameters, completion: handleResponse)
            }
        }
        
        func handleResponse(result: ServerResponse<BaseModel<User>>){
            switch result {
            case .failure(let error):
                self.showMessage(sub: error?.localizedDescription)
            case .success(let model):
                if model.status{
                    self.showMessage(sub: "Profile Updated Successfully !".localized)
                    sendBtnOutlet.dismissLoader()
                    guard let user = model.data else { return  }
                    UserDataActions.cashUserModel(user: user)
                    self.navigationController?.popViewController(animated: true)
                    userImage.kf.setImage(with: URL(string: (UserDataActions.getUserModel()?.photo)!))
                }else{
                    guard let errorMsg = model.msg else{return}
                    self.showMessage(sub: errorMsg)
                }
                
            }
        }

    }

}

// MARK: - image picker
extension MyAccountViewController:UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            uploadedImage = UploadData(data: editedImage.jpegData(compressionQuality: 0.1)!, name: "photo", videoURL: nil, type: "image")
            self.imagePicker = editedImage
        }else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            
            uploadedImage = UploadData(data: originalImage.jpegData(compressionQuality: 0.1)!, name: "photo", videoURL: nil, type: "image")
            self.imagePicker = originalImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
