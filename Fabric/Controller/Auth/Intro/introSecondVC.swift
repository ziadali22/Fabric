//
//  introSecondVC.swift
//  Fabric
//
//  Created by ziad on 02/09/2021.
//

import UIKit

class introSecondVC: UIViewController {

    @IBOutlet weak var DotView: UIView!
    @IBOutlet weak var DetailsText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        DotView.addDashBorder(color: .white, cornerRadius: 3)
        DetailsText.isEditable = false
        
        // get cashed date for the second screen
        DetailsText.text =  UserDataActions.getSettingModel()?.screenTwo
    }
    
    @IBAction func nextToSigninOrSifnup(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "signinOrSignup") as! LoginOrSign
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    

}
