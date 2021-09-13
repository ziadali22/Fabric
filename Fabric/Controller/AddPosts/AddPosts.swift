//
//  AddPosts.swift
//  Fabric
//
//  Created by ziad on 06/09/2021.
//
import MobileCoreServices
import UIKit
import SkyFloatingLabelTextField
class AddPosts: UIViewController{

    
    // MARK: - oulets
    
    @IBOutlet weak var commentText: UITextView!
    @IBOutlet weak var dotView: UIView!
    
    @IBOutlet weak var categoryField: SkyFloatingLabelTextField!
    // MARK: - variables
    
    let pickerView = UIPickerView()
    var categories = [CategoryModel]()
    var videoURL: NSURL?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - add dashBorder
        commentText.addDashBorder(color: .green, cornerRadius: 3)
        dotView.addDashBorder(color: .white, cornerRadius: 3)
        
        // add logo
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "Group 160"))
        
        getCategoriesApi()
        setUpPicker()
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
    
    var imagePicker : UIImage?{
        didSet{
            //the image that will be uploaded
            // MARK: - image url
            guard let _ = imagePicker else { return }
        }
    }


    // MARK: - Netowrk
    func getCategoriesApi(){
        AuthRequestRouter.getCategories.send(BaseModelArray<CategoryModel>.self, then: handleGetResponse)
    }
    var handleGetResponse: HandleResponse<BaseModelArray<CategoryModel>> {
        return { [weak self] (response) in
            guard let self = self else {return}
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
            print("alert 1")
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .savedPhotosAlbum
            picker.mediaTypes = ["public.movie"]
            picker.allowsEditing = false
            self.present(picker, animated: true, completion: nil)
            
            
            
        }))
        alert.addAction(UIAlertAction(title: "Image", style: .default, handler: { action in
            // pick image
            
            print("alert 1")
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
//            let importMenue = UIDocumentPickerViewController(forOpeningContentTypes: [kUTTypePDF], in: .import)

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
            self.imagePicker = editedImage
        }else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.imagePicker = originalImage
        }
        picker.dismiss(animated: true, completion: nil)
    }

}


extension AddPosts: UIDocumentPickerDelegate{
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        //viewModel.attachDocuments(at: urls)
        // MARK: - PDF url
        guard let _ = urls.first else {return}

     func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
        func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
          videoURL = info["UIImagePickerControllerReferenceURL"] as? NSURL
            print(videoURL ?? "")
//          imagePickerController.dismissViewControllerAnimated(true, completion: nil)
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
        categoryField.resignFirstResponder()
    }
}
