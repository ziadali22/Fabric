//
//  TermsViewController.swift
//  Fabric
//
//  Created by ziad on 07/09/2021.
//

import UIKit

class TermsViewController: UIViewController {

    @IBOutlet weak var termsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.termsTextView.text = UserDataActions.getSettingModel()?.terms
    }
    


}
