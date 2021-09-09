//
//  AddCommentPopUpViewController.swift
//  Fabric
//
//  Created by ziad on 08/09/2021.
//

import UIKit

class AddCommentPopUpViewController: UIViewController {

    
    @IBOutlet weak var comntText: UITextView!
    @IBOutlet weak var dotView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //comntText.addDashBorder(color: .green, cornerRadius: 4)
        dotView.addDashBorder(color: .white, cornerRadius: 3)
    }
    
    @IBAction func commentType(_ sender: Any) {
    }
    

    @IBAction func addComment(_ sender: Any) {
    }
    
}
