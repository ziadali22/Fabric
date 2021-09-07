//
//  AboutUsVC.swift
//  Fabric
//
//  Created by ziad on 07/09/2021.
//

import UIKit
import SkyFloatingLabelTextField
class AboutUsVC: UIViewController {


    @IBOutlet weak var aboutUsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.aboutUsTextView.text = UserDataActions.getSettingModel()?.about

    }
    



}
