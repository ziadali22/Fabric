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
        detailsTxt.isEditable = false
        
    }
    


}
