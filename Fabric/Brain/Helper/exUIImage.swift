//
//  extentionUIImage.swift
//  sabeelUser
//
//  Created by Abulrahman mohsen on 3/21/20.
//  Copyright © 2020 Abulrahman mohsen. All rights reserved.
//

import UIKit
extension UIImage {
    func convertToStringBase64() -> String {
        
        let imageData:NSData = self.jpegData(compressionQuality: 0.1)! as NSData
        
        return imageData.base64EncodedString(options: .endLineWithLineFeed)
        
    }
    
    
    func resizeImage(newSize : CGSize) -> UIImage {
        
        UIGraphicsBeginImageContext(CGSize(width: newSize.width, height: newSize.height))
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        var newImage = UIGraphicsGetImageFromCurrentImageContext()
        newImage = newImage?.withRenderingMode(.alwaysOriginal)
        UIGraphicsEndImageContext()
        
        return newImage!
        
        
    }
    
    func resizeTabImage() -> UIImage {
          
          UIGraphicsBeginImageContext(CGSize(width: 30, height: 30))
          self.draw(in: CGRect(x: 0, y: 0, width: 30, height: 30))
          var newImage = UIGraphicsGetImageFromCurrentImageContext()
          newImage = newImage?.withRenderingMode(.alwaysOriginal)
          UIGraphicsEndImageContext()
          
          return newImage!
          
          
      }
    
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
import AVKit

extension AVAsset {

    func generateThumbnail(completion: @escaping (UIImage?) -> Void) {
        DispatchQueue.global().async {
            let imageGenerator = AVAssetImageGenerator(asset: self)
            let time = CMTime(seconds: 0.0, preferredTimescale: 600)
            let times = [NSValue(time: time)]
            imageGenerator.generateCGImagesAsynchronously(forTimes: times, completionHandler: { _, image, _, _, _ in
                if let image = image {
                    completion(UIImage(cgImage: image))
                } else {
                    completion(nil)
                }
            })
        }
    }
}
