//
//  AddPosts.swift
//  Fabric
//
//  Created by ziad on 06/09/2021.
//

import UIKit

class AddPosts: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // add logo
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "Group 160"))
    }
    @IBAction func textRadioBtn(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        }else{
            sender.isSelected = true
        }
    }
    
    @IBAction func photoRadioBtn(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        }else{
            sender.isSelected = true
        }
    }
    
    @IBAction func videoRadioBtn(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        }else{
            sender.isSelected = true
        }
    }

    

}
