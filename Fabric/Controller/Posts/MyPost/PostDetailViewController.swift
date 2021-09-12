//
//  PostDetailViewController.swift
//  Fabric
//
//  Created by ziad on 08/09/2021.
//

import UIKit

class PostDetailViewController: UIViewController {
    

    // MARK: - outlet
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var departmentText: UILabel!
    @IBOutlet weak var dateText: UILabel!
    @IBOutlet weak var userName: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    
    // MARK: - variables
    var post : Item?
    var postId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        DispatchQueue.main.async {
            self.postDetailRequest()
        }
  
    }
    
    // MARK: - add comment pop up

    @IBAction func addCommentPopUP(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "addCommentPopUp") as! AddCommentPopUpViewController
        
        present(vc, animated: true, completion: nil)
    }
    // MARK: - report
    @IBAction func reportBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "reportPopUp") as! ReportPopUpViewController
        present(vc, animated: true, completion: nil)
    }
    // MARK: - user Profile
    
    @IBAction func userProfile(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "userProfile") as! UserProfileViewController
        vc.modalPresentationStyle = .fullScreen
        vc.postId = post?.id
        present(vc, animated: true, completion: nil)
    }
    // MARK: - remove post
    @IBAction func removePost(_ sender: Any) {
        deleteRequest()
    }
    
    // MARK: - Table View
    
}
extension PostDetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post?.comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentsCell", for: indexPath) as! CommentsTableViewCell
        guard let item = post else { return cell }
        cell.cellConfigure(item: item)
        return cell
    }

    
    
}
