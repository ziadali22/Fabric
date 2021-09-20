//
//  AddPosts.swift
//  Fabric
//
//  Created by ziad on 06/09/2021.
//
import MobileCoreServices
import UIKit
import SkyFloatingLabelTextField
import Alamofire
class AddPosts: UIViewController{
    
    
    // MARK: - oulets
    
    @IBOutlet weak var commentText: UITextView!
    @IBOutlet weak var dotView: UIView!
    @IBOutlet weak var addPostBtn: UIButton!
    
    @IBOutlet weak var categoryField: SkyFloatingLabelTextField!
    // MARK: - variables
    var imagePicker : UIImage?
    var videoUrl: URL?
    var pdfUrl: URL?
    let pickerView = UIPickerView()
    var categories = [CategoryModel]()
    var categoryId: Int?
    var imagePickerController = UIImagePickerController()
    
    //var uploadedData: [MultipartFormData]?
    var uploadedImage: UploadData?
    var uploadVideo: UploadDataURL?
    var uploadPdf: UploadDataURL?
    var uploadText: UploadData?
    
    
    var uVideo: UploadData?
    var uPdf: UploadData?
    var uText: UploadData?
    var con: String?
    
    
    

        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - add dashBorder
        DispatchQueue.main.async {
            self.commentText.addDashBorder(color: .green, cornerRadius: 3)
            self.dotView.addDashBorder(color: .white, cornerRadius: 3)
        }
        
        // add logo
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "Group 160"))
        
        getCategoriesApi()
        setUpPicker()
        
        
    }
    
    
    private func openImgPicker() {
        imagePickerController.sourceType = .savedPhotosAlbum
        imagePickerController.delegate = self
        imagePickerController.mediaTypes = ["public.movie"]
        present(imagePickerController, animated: true, completion: nil)
    }
    // MARK: - validation for add posts
    func validation(){
        guard let commentTF = commentText.text , !commentTF.isEmpty else { return self.showMessage(sub: "check valid content ".localized)}
        guard let categoryTF = categoryField.text, !categoryTF.isEmpty else { return self.showMessage(sub: "check valid category field".localized) }

        
        
    }
    // MARK: - First Method for uploading
    enum UploadCases {
        
        case image
        case video
        case pdf
        case text
    }
    func uploadMethod(cases: UploadCases)  {
        switch cases {
        
        case .image:
            guard let image = uploadedImage else { return uploadMethod(cases: .text)}
            guard let video = uVideo else { return uploadMethod(cases: .text) }
            guard let pdf = uPdf else { return  uploadMethod(cases: .text)}
            guard let text = uText else { return print("nothind chosed") }
            
            let imagesArr = [image,video, pdf, text]
            let parameters = ["content_type": "image","description":commentText.text!,"category_id": categoryId ?? 0] as [String : Any]
            let header = ["Authorization":"Berear\(UserDataActions.getUserModel()?.token ?? "")", "Accept": "application/json"]
            // IMAGE
            self.addPostBtn.showLoader()
            AlamofireMultiPart.PostMultiWithModel(model: ValueModel.self,
                                                  url: "http://fabric.panorama-q.com/api/posts",
                                                  Images: imagesArr,
                                                  header: header,
                                                  parameters: parameters,
                                                  completion: handleResponse)
        case .video:
            guard let image = uploadedImage else { return uploadMethod(cases: .text)}
            guard let video = uVideo else { return uploadMethod(cases: .text) }
            guard let pdf = uPdf else { return  uploadMethod(cases: .text)}
            guard let text = uText else { return print("nothind chosed") }
            let imagesArr = [image,video, pdf, text]
            let parameters = ["content_type": "video","description":commentText.text!,"category_id": categoryId ?? 0] as [String : Any]
            let header = ["Authorization":"Berear\(UserDataActions.getUserModel()?.token ?? "")", "Accept": "application/json"]
            // IMAGE
            self.addPostBtn.showLoader()
            AlamofireMultiPart.PostMultiWithModel(model: ValueModel.self,
                                                  url: "http://fabric.panorama-q.com/api/posts",
                                                  Images: imagesArr,
                                                  header: header,
                                                  parameters: parameters,
                                                  completion: handleResponse)
        case .pdf:
            let parameters = ["content_type": "pdf","description":commentText.text!,"category_id": categoryId ?? 0] as [String : Any]
            guard let image = uploadedImage else { return uploadMethod(cases: .text)}
            guard let video = uVideo else { return uploadMethod(cases: .text) }
            guard let pdf = uPdf else { return  uploadMethod(cases: .text)}
            guard let text = uText else { return print("nothind chosed") }
            let imagesArr = [image,video, pdf, text]
            
            let header = ["Authorization":"Berear\(UserDataActions.getUserModel()?.token ?? "")", "Accept": "application/json"]
            // IMAGE
            self.addPostBtn.showLoader()
            AlamofireMultiPart.PostMultiWithModel(model: ValueModel.self,
                                                  url: "http://fabric.panorama-q.com/api/posts",
                                                  Images: imagesArr,
                                                  header: header,
                                                  parameters: parameters,
                                                  completion: handleResponse)
        case .text:
            
            let parameters = ["content_type": "text","description":commentText.text!,"category_id": categoryId ?? 0] as [String : Any]
            guard let image = uploadedImage else { return uploadMethod(cases: .text)}
            guard let video = uVideo else { return uploadMethod(cases: .text) }
            guard let pdf = uPdf else { return  uploadMethod(cases: .text)}
            guard let text = uText else { return print("nothind chosed") }
            let imagesArr = [image,video, pdf, text]
            let header = ["Authorization":"Berear\(UserDataActions.getUserModel()?.token ?? "")", "Accept": "application/json"]
            // IMAGE
            self.addPostBtn.showLoader()
            AlamofireMultiPart.PostMultiWithModel(model: ValueModel.self,
                                                  url: "http://fabric.panorama-q.com/api/posts",
                                                  Images: imagesArr,
                                                  header: header,
                                                  parameters: parameters,
                                                  completion: handleResponse)

        }
        
    }
    
  
    

    
    @IBAction func addPost(_ sender: Any) {
        // MARK: - Second Method
        let header = ["Authorization":"Berear\(UserDataActions.getUserModel()?.token ?? "")", "Accept": "application/json"]
        if uploadedImage != nil{
            self.addPostBtn.showLoader()
            ///content_type": "image
            let parameters = ["content_type": "image","description":commentText.text!,"category_id": categoryId ?? 0] as [String : Any]
            //uploadM(SendParmaeters: parameters)
            if let image = uploadedImage {
                let imageArr = [image ]
                AlamofireMultiPart.PostMultiWithModel(model: ValueModel.self,
                                                      url: "http://fabric.panorama-q.com/api/posts",
                                                      Images: imageArr, header: header, parameters: parameters, completion: handleResponse)
            }
        }
        else if uploadVideo != nil {
            ///content_type": "video
            self.addPostBtn.showLoader()
            let parameters = ["content_type": "video","description":commentText.text!,"category_id": categoryId ?? 0] as [String : Any]
            //uploadM(SendParmaeters: parameters)
            if let video = uVideo {
                let videoArr = [video]
                AlamofireMultiPart.PostMultiWithModel(model: ValueModel.self,
                                                      url: "http://fabric.panorama-q.com/api/posts",
                                                      Images: videoArr, header: header, parameters: parameters, completion: handleResponse)
            }
        }
        else if uploadPdf != nil{
            self.addPostBtn.showLoader()
            let parameters = ["content_type": "pdf","description":commentText.text!,"category_id": categoryId ?? 0] as [String : Any]
            //uploadM(SendParmaeters: parameters)
            if let pdf = uPdf {
                let pdfArr = [pdf]
                AlamofireMultiPart.PostMultiWithModel(model: ValueModel.self,
                                                      url: "http://fabric.panorama-q.com/api/posts",
                                                      Images: pdfArr, header: header, parameters: parameters, completion: handleResponse)
            }
        }
        else{
//            let parameters = ["content_type": "text","description":commentText.text!,"category_id": categoryId ?? 0] as [String : Any]
//            uploadM(SendParmaeters: parameters)
            self.addPostBtn.showLoader()
            uploadAddPostRequest(text: commentText.text)
        }

        func uploadM(SendParmaeters: [String : Any] ){
            guard let image = uploadedImage else { return }
            
            guard let video = uVideo else { return }
            guard let pdf = uPdf else { return  }
            guard let text = uText else { return  }
            
            let imagesArr = [image,video, pdf, text]
            
            let parameters = SendParmaeters
            let header = ["Authorization":"Berear\(UserDataActions.getUserModel()?.token ?? "")", "Accept": "application/json"]
            // IMAGE
            self.addPostBtn.showLoader()
            AlamofireMultiPart.PostMultiWithModel(model: ValueModel.self,
                                                  url: "http://fabric.panorama-q.com/api/posts",
                                                  Images: imagesArr,
                                                  header: header,
                                                  parameters: parameters,
                                                  completion: handleResponse)
        }
        
//        //validation()
//        guard let image = uploadedImage else { return }
//        guard let video = uVideo else { return  }
//        guard let pdf = uPdf else { return  }
//        guard let text = uText else { return  }
        
//        let imagesArr = [image,video, pdf, text]
//
//        let parameters = ["content_type": "image","description":commentText.text!,"category_id": categoryId ?? 0] as [String : Any]
//        let header = ["Authorization":"Berear\(UserDataActions.getUserModel()?.token ?? "")", "Accept": "application/json"]
//        // IMAGE
//        self.addPostBtn.showLoader()
//        AlamofireMultiPart.PostMultiWithModel(model: ValueModel.self,
//                                              url: "http://fabric.panorama-q.com/api/posts",
//                                              Images: imagesArr,
//                                              header: header,
//                                              parameters: parameters,
//                                              completion: handleResponse)
//        // VIDEO
//        guard let video = uploadVideo else { return  }
//        let videoArr = [video]
//        let parametersForVideo = ["content_type": "url","description":commentText.text!,"category_id": categoryId ?? 0] as [String : Any]
//        AlamofireMultiPartUrl.PostMultiWithModel(model: ValueModel.self,
//                                                 url: url,
//                                                 URL: videoArr,
//                                                 header: header,
//                                                 parameters: parametersForVideo,
//                                                 completion: hanldeResponseForUrl)
//        // PDF
//
//        guard let pdf = uploadPdf else { return  }
//        let pdfArr = [pdf]
//        let parameterForPdf = ["content_type": "url","description":commentText.text!,"category_id": categoryId ?? 0] as [String : Any]
//        AlamofireMultiPartUrl.PostMultiWithModel(model: ValueModel.self, url: url, URL: pdfArr, header: header, parameters: parameterForPdf, completion: hanldeResponseForUrl)
//
//
//
//        //TEXT
////        guard let text = uploadText else {return}
////        let textArr = [text]
//        let parameterForText = ["content_type": "text","description":commentText.text!,"category_id": categoryId ?? 0] as [String : Any]
//        AlamofireMultiPart.PostMultiWithModel(model: ValueModel.self, url: url, Images: nil, header: header, parameters: parameterForText, completion: handleResponse)
//

        
        


        
    }
    func successRegister(msg: String){
        self.showMessage(sub: "Register successfully")
    }
    
    func handleResponse(result: ServerResponse<ValueModel>){
        self.addPostBtn.dismissLoader()
        switch result {
        case .failure(let error):
            self.showMessage(sub: error?.localizedDescription)
        case .success(let model):
            if model.status{
                self.showMessage(sub: "Post Added Succefully !".localized)
            }else{
                guard let errorMsg = model.msg else{return}
                self.showMessage(sub: errorMsg)
            }
            
        }
    }
    
    func hanldeResponseForUrl(result: ServerEsponse<ValueModel>){
        switch result {
        case .failure(let error):
            self.showMessage(sub: error?.localizedDescription)
        case .success(let model):
            if model.status{
                self.showMessage(sub: "Post Added Succefully !".localized)
            }else{
                guard let errorMsg = model.msg else{return}
                self.showMessage(sub: errorMsg)
            }
            
        }
    }
    
    
    @IBAction func getNotfications(_ sender: Any) {
        let vc  = storyboard?.instantiateViewController(identifier: "notificationHome") as! NotificationViewController
        show(vc, sender: nil)
    
    }
    
    // MARK: - pickerView
    func setUpPicker(){
        self.categoryField.inputView = self.pickerView
        //self.categoryField.inputAccessoryView = self.pickerView.toolbar
        self.categoryField.textAlignment = .center
        self.categoryField.placeholder = "choose Department"
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        //self.pickerView.toolbarDelegate = self
        
        self.pickerView.reloadAllComponents()
        
    }
    
    
    // MARK: - Netowrk
    func getCategoriesApi(){
        self.view.showLoader()
        AuthRequestRouter.getCategories.send(BaseModelArray<CategoryModel>.self, then: handleGetResponse)
    }
    var handleGetResponse: HandleResponse<BaseModelArray<CategoryModel>> {
        return { [weak self] (response) in
            guard let self = self else {return}
            self.view.dismissLoader()
            switch response {
            case .failure(let error):
                self.showMessage(sub: error.localizedDescription)
            case .success(let model):
                if model.status{
                    guard let item = model.data else {return}
                    self.categories = item
                    print(self.categories)
                }else{
                    guard let errorMsg = model.msg else{return}
                    self.showMessage(sub: errorMsg)
                }
                
            }
        }
    }
    // MARK: - Alert For Attachment
    @IBAction func attachmentBtn(_ sender: Any) {
        showAlertView()
        
    }
    func showAlertView(){
        let alert = UIAlertController(title: "choose data type", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Video", style: .default, handler: { action in
            // get video url
            self.openImgPicker()
            
            
        }))
        alert.addAction(UIAlertAction(title: "Image", style: .default, handler: { action in
            // pick image
            let picker = UIImagePickerController()
            picker.allowsEditing = true
            picker.sourceType = .photoLibrary
            picker.delegate = self
            self.present(picker, animated: true, completion: nil)
            
            
        }))
        alert.addAction(UIAlertAction(title: "PDF", style: .default, handler: { action in
            // get PDF url
            let types = [kUTTypePDF, kUTTypeText, kUTTypeRTF, kUTTypeSpreadsheet]
            let importMenu = UIDocumentPickerViewController(documentTypes: types as [String], in: .import)
            //            let importMenu = UIDocumentPickerViewController(forOpeningContentTypes: [kUTTypePDF], in: .import)
            
            importMenu.delegate = self
            importMenu.modalPresentationStyle = .formSheet
            
            self.present(importMenu, animated: true)
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
}

extension AddPosts:UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            uploadedImage = UploadData(data: editedImage.jpegData(compressionQuality: 0.1)!, name: "content", videoURL: nil, type: "image")
            self.imagePicker = editedImage
        }else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            /// uploadedData?.append(originalImage, withName: "content")
            /// uploadedData?.append(originalImage, withName: "content", fileName: "myImage.png", mimeType: "image/png")
            //  imageData!, withName: "content", fileName: "myImage.png", mimeType: "image/png"
            uploadedImage = UploadData(data: originalImage.jpegData(compressionQuality: 0.1)!, name: "image", videoURL: nil, type: "image")
            self.imagePicker = originalImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        videoUrl = info[UIImagePickerController.InfoKey.mediaURL.rawValue] as? URL
        uploadVideo = UploadDataURL(data: videoUrl!, name: "content")
        print("videoURL:\(String(describing: videoUrl))")
        self.dismiss(animated: true, completion: nil)
    }
}


extension AddPosts: UIDocumentPickerDelegate{
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        //viewModel.attachDocuments(at: urls)
        // MARK: - PDF url
        pdfUrl = urls.first
        guard let pdfURL = pdfUrl else { return}
        uploadPdf = UploadDataURL(data: pdfURL, name: "content")
        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            controller.dismiss(animated: true, completion: nil)
        }
    }
    
    
}
extension AddPosts: UIPickerViewDataSource, UIPickerViewDelegate  {
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row].name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categoryField.text = categories[row].name
        categoryId = categories[row].id
        categoryField.resignFirstResponder()
    }
    
    
    
}
