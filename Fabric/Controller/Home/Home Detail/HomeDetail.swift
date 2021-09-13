//
//  HomeDetail.swift
//  Fabric
//
//  Created by ziad on 09/09/2021.
//

import UIKit

class HomeDetail: UIViewController {

    // MARK: - outlet
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    @IBOutlet weak var postDate: UILabel!
    @IBOutlet weak var userName: UIButton!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var departmentTitle: UILabel!
    
    // MARK: - variables
    var homePost: Item?
    var homePostId : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        homeTableView.separatorStyle = .none
        
        
    }
    
    // MARK: - add comment popUp
    @IBAction func addCommentBtn(_ sender: Any) {

    }
    // MARK: - report popUp
    @IBAction func reportPopUp(_ sender: Any) {

    }
    

}
