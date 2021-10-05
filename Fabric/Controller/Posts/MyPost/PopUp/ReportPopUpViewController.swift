//
//  ReportPopUpViewController.swift
//  Fabric
//
//  Created by ziad on 08/09/2021.
//

import UIKit

class ReportPopUpViewController: UIViewController {

    @IBOutlet weak var textOutlet: UILabel!
    // MARK: - variables
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textOutlet.text = "the report sent to the manager and it will be review soon!".localized
        textOutlet.font = UIFont(name: "PNU-Bold", size: 16)
        
    }
    
    @IBAction func reportDismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
