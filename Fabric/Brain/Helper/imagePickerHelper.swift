//
//  imagePickerHelper.swift
//  sabeelUser
//
//  Created by Abulrahman mohsen on 3/21/20.
//  Copyright © 2020 Abulrahman mohsen. All rights reserved.
//

//import UIKit
//
//class imagePickerHelper: NSObject ,ImagePickerDelegate {
//
//    private weak var presentingViewController: UIViewController?
//
//
//    private lazy var imagePicker: ImagePickerController = {
//        let imagePicker = ImagePickerController()
//        imagePicker.delegate = self
//        //imagePicker.imageLimit = 1
//        return imagePicker
//    }()
//
//    var imageSelected: ((_ image: UIImage) -> ())?
//    var imagesSelected : ((_ images : [UIImage])->())?
//    init(viewController : UIViewController,limit : Int? = 1) {
//        super.init()
//        presentingViewController = viewController
//        imagePicker.imageLimit = limit ?? 1
//    }
//
//    func presentImagePicker() {
//        imagePicker.modalPresentationStyle = .fullScreen
//        presentingViewController?.present(imagePicker, animated: true, completion: nil)
//    }
//
//    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
//
//    }
//
//    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
//        imagePicker.dismiss(animated: true, completion: nil)
//        print(images.count)
//        if imagePicker.imageLimit == 1 {
//            if let image = images.first {
//                imageSelected?(image)
//            }
//        }else{
//         imagesSelected?(images)
//        }
//    }
//
//    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
//       // presentingViewController?.dismiss(animated: true, completion: nil)
//    }
    
    
/*
     private weak var presentingViewController: UIViewController?
     
     private lazy var imagePicker: UIImagePickerController = {
     let imagePicker = UIImagePickerController()
     imagePicker.allowsEditing = false
     imagePicker.sourceType = .photoLibrary
     imagePicker.delegate = self
     return imagePicker
     }()
     
     var imageSelected: ((_ image: UIImage) -> ())?
     
     init(viewController: UIViewController) {
     super.init()
     presentingViewController = viewController
     }
     
     func presentImagePicker() {
     presentingViewController?.present(imagePicker, animated: true, completion: nil)
     }
     
     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
     if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
     imageSelected?(pickedImage)
     } else if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
     imageSelected?(pickedImage)
     }
     presentingViewController?.dismiss(animated: true, completion: nil)
     }
     
     func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
     presentingViewController?.dismiss(animated: true, completion: nil)
     }
     */
//}
