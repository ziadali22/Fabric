//
//  ShowAlert+FUN.swift
//  Fabric
//
//  Created by ziad on 28/09/2021.
//

import Foundation
import MobileCoreServices
import UIKit
extension AddPosts{
    func showAlertView(){
        let alert = UIAlertController(title: "choose data type", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Video", style: .default, handler: { action in
            // get video url
            self.isVideo = true
            self.present(self.imagePickerController, animated: true, completion: nil)
            
            
        }))
        alert.addAction(UIAlertAction(title: "Image", style: .default, handler: { action in
            // pick image
            self.isVideo = false
            let picker = UIImagePickerController()
            picker.allowsEditing = true
            picker.sourceType = .photoLibrary
            picker.delegate = self
            self.present(picker, animated: true, completion: nil)
            
            
        }))
        alert.addAction(UIAlertAction(title: "PDF", style: .default, handler: { action in
            // get PDF url
            self.isVideo = false
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
