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
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.separatorStyle = .none
        HomeDetailRequest()
        
    }
    
    // MARK: - add comment popUp
    @IBAction func addCommentBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "homeAddComment") as! AddCommentViewController
        
        present(vc, animated: true, completion: nil)
    }
    // MARK: - report popUp
    @IBAction func reportPopUp(_ sender: Any) {
        let vc  = storyboard?.instantiateViewController(identifier: "homeReport") as! ReportViewController
        present(vc, animated: true, completion: nil)
    }
    

}
// MARK: -  home tableview
extension HomeDetail: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homePost?.comments?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeTableCell") as! HomeCommentsTableVC
        guard let item = homePost else { return cell}
        cell.homeCellConfigure(item: item)
        return cell
    }
    
    
}
