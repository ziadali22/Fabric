//
//  OpenImageVC.swift
//  Fabric
//
//  Created by ziad on 02/10/2021.
//

import UIKit
import Kingfisher
class OpenImageVC: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    var imageUrl: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("image: \(String(describing: imageUrl))")
        imageView.kf.setImage(with: URL(string: imageUrl ?? ""),placeholder: UIImage(named: "1276px-Placeholder_view_vector.svg"))
    }
    @IBAction func dismissImage(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
