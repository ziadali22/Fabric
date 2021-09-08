//
//  PopUPChangePasswordVC.swift
//  Fabric
//
//  Created by ziad on 07/09/2021.
//

import UIKit
import SkyFloatingLabelTextField
class PopUPChangePasswordVC: UIViewController {

    @IBOutlet weak var dotView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dotView.addDashBorder(color: .white, cornerRadius: 3)
    }
    
    @IBAction func dismissBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    


}
