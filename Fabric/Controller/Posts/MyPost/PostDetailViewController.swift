//
//  PostDetailViewController.swift
//  Fabric
//
//  Created by ziad on 08/09/2021.
//

import UIKit

class PostDetailViewController: UIViewController {
    

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
    var comntId: Int?
    var commentData : Comment?
    var postsData : MostComment?
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
        
        present(vc, animated: true, completion: nil)
    }
    // MARK: - report
    @IBAction func reportBtn(_ sender: Any) {
        reportRequest()
        let vc = storyboard?.instantiateViewController(identifier: "reportPopUp") as! ReportPopUpViewController
        
        if post?.isReported == true{
            post?.isReported = false
        }
        else{
            post?.isReported = true
        }
        
        present(vc, animated: true, completion: nil)
    }
    
    func reportRequest(){
        AuthRequestRouter.reportComment(id: comntId ?? 0).send(StringModel.self, then: reportHandleResponse)
    }
    
    var reportHandleResponse: HandleResponse<StringModel> {
        return { [weak self] (response) in
            guard let self = self else {return}
            self.view.isUserInteractionEnabled = true
            switch response {
            case .failure(let error):
                self.showMessage(sub: error.localizedDescription)
            case .success(let model):
                if model.status{
                    guard let item = model.data else {return}
                    self.sucessReporting(msg: item)
                    if self.post?.isReported == true{
                        
                        self.post?.isReported = false
                    }
                    else{
                        self.post?.isReported = true
                    }
                }else{
                    guard let errorMsg = model.msg else{return}
                    self.showMessage(sub: errorMsg)
                }
                
            }
        }
    }

    func sucessReporting(msg: String){
        self.showMessage(sub: "comment reported successfully ")
        
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
    
    @IBAction func deleteComment(_ sender: Any) {
        deleteCommentRequest()
        tableView.reloadData()
        
        
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
        comntId = post?.comments?[indexPath.row].id
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(tableView.frame.height / 2.1 )
        
        
    }

    
}
