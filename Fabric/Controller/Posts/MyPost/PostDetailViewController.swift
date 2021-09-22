//
//  PostDetailViewController.swift
//  Fabric
//
//  Created by ziad on 08/09/2021.
//

import UIKit

class PostDetailViewController: UIViewController , RefreshViewProtcol {
    
    
    func reloadData() {
        postDetailRequest()
        tableView.reloadData()
    }
    
    // MARK: - outlet
    @IBOutlet weak var commentCount: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var departmentText: UILabel!
    @IBOutlet weak var dateText: UILabel!
    @IBOutlet weak var userName: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    @IBOutlet weak var deleteBtn: UIButton!
    
    
    

    // MARK: - variables
    var post : Item?
    var newPost = [Item]()
    var postId: Int?
    var commentData : [Comment]?
    var postsData : MostComment?
    
    var imageCommentContent : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.separatorInset = .zero
        tableView.alwaysBounceVertical = false
        tableView.isScrollEnabled = false
        tableView.sectionHeaderHeight = 0.0;
        DispatchQueue.main.async {
            self.postDetailRequest()
        }

 
    }

    // MARK: - add comment pop up

    @IBAction func addCommentPopUP(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "addCommentPopUp") as! AddCommentPopUpViewController
        vc.postId = post?.id
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
        guard let item = post?.comments?[indexPath.row] else { return cell }
        cell.cellConfigure(item: item)
        cell.deleteHandelr = {
            let id = item.id
            self.deleteCommentRequest(id: id)
        }
        cell.reportHandler = {
            let id = item.id
            self.reportRequest(id: id)
            
        }

        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
        
        
    }

    
}
