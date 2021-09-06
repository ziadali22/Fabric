//
//  IntroVC.swift
//  Fabric
//
//  Created by ziad on 29/08/2021.
//

import UIKit

class IntroVC: UIViewController {

    @IBOutlet weak var MainView: UIView!
    @IBOutlet weak var DotView: UIView!
    @IBOutlet weak var detailsTxt: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DotView.addDashBorder(color: .white, cornerRadius: 3)
        // make text view not editable
        detailsTxt.isEditable = false
        // get chashed date for first screnn
        self.detailsTxt.text = UserDataActions.getSettingModel()?.screenOne
        
    }
    
    ///UserDataActions.getSettingModel()?.screenTwo
    
    
    @IBAction func next(_ sender: Any) {
        // send me to the second screen
        let vc = storyboard?.instantiateViewController(identifier: "Cell") as! introSecondVC
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
}

