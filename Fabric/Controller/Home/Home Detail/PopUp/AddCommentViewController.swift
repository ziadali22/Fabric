//
//  AddCommentViewController.swift
//  Fabric
//
//  Created by ziad on 12/09/2021.
//

import UIKit

class AddCommentViewController: UIViewController {
    
    
    fileprivate let identifer = "homeAddComment"
    
    @IBOutlet weak var commentTV: UITextView!
    
    @IBOutlet weak var dotView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        dotView.addDashBorder(color: .white, cornerRadius: 3)
        
        commentTV.addDashBorder(color: .green, cornerRadius: 3)

        
    }
    
    @IBAction func commentType(_ sender: Any) {
    }
    
    @IBAction func addComment(_ sender: Any) {
    }
    

}
