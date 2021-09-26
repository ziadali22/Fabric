//
//  AddCommentPopUpViewController.swift
//  Fabric
//
//  Created by ziad on 08/09/2021.
//
import MobileCoreServices
import UIKit
import SkyFloatingLabelTextField
import Alamofire




class AddCommentPopUpViewController: UIViewController, UITextViewDelegate  {
    
    // MARK: - variables
    var imagePickerControllerForAddComments = UIImagePickerController()
    var imagePicker : UIImage?
    var videoUrl: URL?
    var pdfUrl: URL?
    var uploadedImage: UploadData?
    var uploadPdf: UploadData?
    
    var delegate: RefreshViewProtcol?
    // post ID
    var postId: Int?
    
    @IBOutlet weak var comntText: UITextView!
    @IBOutlet weak var dotView: UIView!
    @IBOutlet weak var addBtn: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        comntText.addDashBorder(color: .green, cornerRadius: 4)
        comntText.delegate = self
        comntText.text = "place holder"
        comntText.textColor = UIColor.lightGray
        dotView.addDashBorder(color: .white, cornerRadius: 3)
    }
    
    @IBAction func dismissPopUP(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func commentType(_ sender: Any) {
        showAlertView()
    }
    
    // MARK: - show alert
    func showAlertView(){
        
        let alert = UIAlertController(title: "choose data type", message: "", preferredStyle: .alert)
        
        // image
        alert.addAction(UIAlertAction(title: "Image", style: .default, handler: { action in
            // pick image
            let picker = UIImagePickerController()
            picker.allowsEditing = true
            picker.sourceType = .photoLibrary
            picker.delegate = self
            self.present(picker, animated: true, completion: nil)
            
            self.comntText.isHidden = true
            
        }))
        // pdf
        alert.addAction(UIAlertAction(title: "PDF", style: .default, handler: { action in
            // get PDF url
            let types = [kUTTypePDF, kUTTypeText, kUTTypeRTF, kUTTypeSpreadsheet]
            let importMenu = UIDocumentPickerViewController(documentTypes: types as [String], in: .import)
            
            importMenu.delegate = self
            importMenu.modalPresentationStyle = .formSheet
            
            self.present(importMenu, animated: true)
            
            self.comntText.isHidden = true
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    // MARK: - Network for add comment
    @IBAction func addComment(_ sender: Any) {
        let header = ["Authorization":"Berear\(UserDataActions.getUserModel()?.token ?? "")", "Accept": "application/json"]
        if uploadedImage != nil{
            
            addBtn.showLoader()
            if let image = uploadedImage {
                let imageArr = [image]
                let id = postId
                let parameters = ["type": "image"] as [String : Any]
                AlamofireMultiPart.PostMultiWithModel(model: ValueModel.self,
                                                      url: "http://fabric.panorama-q.com/api/comments/\(id ?? 0)",
                                                      Images: imageArr,
                                                      header: header,
                                                      parameters: parameters,
                                                      completion: handleResponse)
            }
        }
        else if uploadPdf != nil{
            addBtn.showLoader()
            let parameters = ["type": "pdf"]
            if let pdf = uploadPdf {
                let imageArr = [pdf ]
                let id = postId
                AlamofireMultiPart.PostMultiWithModel(model: ValueModel.self,
                                                      url: "http://fabric.panorama-q.com/api/comments/\(id ?? 0)",
                                                      Images: imageArr, header: header, parameters: parameters, completion: handleResponse)
            }
        }
        else {
            // FOR TEXT UPLOAD
            addBtn.showLoader()
            let parameters = ["type": "text", "description": comntText.text ?? ""]
            let id = postId
            AlamofireMultiPart.PostMultiWithModel(model: ValueModel.self,
                                                  url: "http://fabric.panorama-q.com/api/comments/\(id ?? 0)",
                                                  Images: nil, header: header, parameters: parameters, completion: handleResponse)
        }
        
        
        
        
        
    }
    func successRegister(msg: String){
        self.showMessage(sub: "Register successfully")
    }
    
    func handleResponse(result: ServerResponse<ValueModel>){
        addBtn.dismissLoader()
        switch result {
        case .failure(let error):
            self.showMessage(sub: error?.localizedDescription)
        case .success(let model):
            if model.status{
                self.showMessage(sub: "Comment Added Succefully !".localized)
                self.dismiss(animated: true, completion: nil)
                self.delegate?.reloadData()

            }else{
                guard let errorMsg = model.msg else{return}
                self.showMessage(sub: errorMsg)
            }
            
        }
    }
    
}
// MARK: - image picker
extension AddCommentPopUpViewController:UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            uploadedImage = UploadData(data: editedImage.jpegData(compressionQuality: 0.1)!, name: "comment_content", videoURL: nil, type: "image")
            self.imagePicker = editedImage
        }else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            
            uploadedImage = UploadData(data: originalImage.jpegData(compressionQuality: 0.1)!, name: "comment_content", videoURL: nil, type: "image")
            self.imagePicker = originalImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

// MARK: - pdf picker
extension AddCommentPopUpViewController: UIDocumentPickerDelegate{
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        pdfUrl = urls.first
        uploadPdf = UploadData(data: pdfUrl?.dataRepresentation, name: "comment_content", videoURL: nil, type: "pdf")
        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            controller.dismiss(animated: true, completion: nil)
        }
    }
    
    
}


