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
    @IBOutlet weak var addPostBtn: UIButton!
    
    @IBOutlet weak var categoryField: SkyFloatingLabelTextField!
    // MARK: - variables
    var imagePicker : UIImage?
    var videoUrl: URL?
    var pdfUrl: URL?
    let pickerView = UIPickerView()
    var categories = [CategoryModel]()
    var categoryId: [Int]?
    var imagePickerController = UIImagePickerController()
 
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
        
        
        for i in categories{
            if let id = i.id{
                categoryId?.append(id)
            }
        }
        uploadAddPostRequest(video: videoUrl, pdf:pdfUrl , image: imagePicker)
        
    }
    
    @IBAction func addPost(_ sender: Any) {
        validation()
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
            self.imagePicker = editedImage
        }else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.imagePicker = originalImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        videoUrl = info[UIImagePickerController.InfoKey.mediaURL.rawValue] as? URL
        print("videoURL:\(String(describing: videoUrl))")
        self.dismiss(animated: true, completion: nil)
    }
}


extension AddPosts: UIDocumentPickerDelegate{
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        //viewModel.attachDocuments(at: urls)
        // MARK: - PDF url
        pdfUrl = urls.first
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
        categoryField.resignFirstResponder()
    }
   


}
