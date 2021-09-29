//
//  PickerViewImage+pdf+video.swift
//  Fabric
//
//  Created by ziad on 28/09/2021.
//

import Foundation
import UIKit
// MARK: - IMAGE , VIDEO
extension AddPosts:UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if isVideo == true{
            videoUrl = info[.mediaURL] as? URL
            uploadVideo = UploadData(data: nil, name: "content", videoURL: videoUrl, type: "video")
            print("videoURL:\(String(describing: videoUrl))")
            self.dismiss(animated: true, completion: nil)
        }else{
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            uploadedImage = UploadData(data: editedImage.jpegData(compressionQuality: 0.1)!, name: "content", videoURL: nil, type: "image")
            self.imagePicker = editedImage
        }else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            uploadedImage = UploadData(data: originalImage.jpegData(compressionQuality: 0.1)!, name: "content", videoURL: nil, type: "image")
            self.imagePicker = originalImage
        }
            picker.dismiss(animated: true, completion: nil)
            
        }
    }

}

// MARK: - PDF
extension AddPosts: UIDocumentPickerDelegate{
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        //viewModel.attachDocuments(at: urls)
        
        pdfUrl = urls.first
        uploadPdf = UploadData(data: nil, name: "content", videoURL: pdfUrl , type: "pdf")
        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            controller.dismiss(animated: true, completion: nil)
        }
    }
    
    
}
