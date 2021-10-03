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
    @IBOutlet weak var searchBar: UISearchBar!
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
    var uploadVideo: UploadData?
    var uploadPdf: UploadData?
    var uploadText: UploadData?
    var uVideo: UploadData?
    var uPdf: UploadData?
    var uText: UploadData?
    var con: String?
    var isVideo: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        // add logo
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "Group 160"))
        DispatchQueue.main.async {
            self.commentText.addDashBorder(color: .green, cornerRadius: 3)
            self.dotView.addDashBorder(color: .white, cornerRadius: 3)
        }
        // network requeest
        getCategoriesApi()
        setUpPicker()
        // add placeHolder
        commentText.delegate = self
        commentText.text = "Add your post text content here".localized
        commentText.textColor = UIColor.lightGray
        imagePickerController.delegate = self
        imagePickerController.sourceType = .savedPhotosAlbum
        imagePickerController.mediaTypes = ["public.movie"]
        
    }
    
    
     func openImgPicker() {

       
    }
    // MARK: - validation for add posts
    func validation(){
        guard let commentTF = commentText.text , !commentTF.isEmpty else { return self.showMessage(sub: "check valid content ".localized)}
        guard let categoryTF = categoryField.text, !categoryTF.isEmpty else { return self.showMessage(sub: "check valid category field".localized) }
        
    }
    
    // MARK : - Add Post
    @IBAction func addPost(_ sender: Any) {
        uploadRequest()
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
        self.categoryField.placeholder = "Choose Department".localized
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        self.pickerView.reloadAllComponents()
    }
    
    

    // MARK: - Alert For Attachment
    @IBAction func attachmentBtn(_ sender: Any) {
        showAlertView()
    }
}

// MARK: - Categories Department
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
