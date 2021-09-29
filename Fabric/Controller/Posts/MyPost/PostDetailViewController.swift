//
//  PostDetailViewController.swift
//  Fabric
//
//  Created by ziad on 08/09/2021.
//

import UIKit
import AVKit
import AVFoundation

class PostDetailViewController: UIViewController , RefreshViewProtcol {
    
    func reloadData() {
        postDetailRequest()

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
    @IBOutlet weak var scrollViewPost: UIScrollView!
    @IBOutlet weak var videoPlayBtn: UIButton!
    @IBOutlet weak var openPdfBtn: UIButton!
    @IBOutlet weak var addCommentTitle: UIButton!
    @IBOutlet weak var commentsTitle: UILabel!
    
    @IBOutlet weak var commentCountTitle: UILabel!
    
   // MARK: - variables
    var post : Item?
    var newPost = [Item]()
    var postId: Int?
    var commentData : [Comment]?
    var postsData : MostComment?
    var imageCommentContent : String?
    var pdfHanlder: ActionClouser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // localization
        videoPlayBtn.setTitle("Play Video".localized, for: .normal)
        openPdfBtn.setTitle("Open Pdf".localized, for: .normal)
        addCommentTitle.setTitle("Add Comment".localized, for: .normal)
        commentsTitle.text = "comments".localized
        commentCountTitle.text = "comment".localized
        //----
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.separatorInset = .zero
        tableView.alwaysBounceVertical = false
        tableView.isScrollEnabled = false
        tableView.sectionHeaderHeight = 0.0;
        showSpinner(onView: self.view)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.postDetailRequest()
            self.tableView.reloadData()
            
        }
        
    }

    // MARK: - add comment pop up

    @IBAction func addCommentPopUP(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "addCommentPopUp") as! AddCommentPopUpViewController
        vc.postId = post?.id
        vc.delegate = self
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
        navigationController?.popViewController(animated: true)
        tableView.reloadData()
        deleteRequest()
    }
    // MARK: - Play Video
    @IBAction func videoPlayButton(_ sender: Any) {
        videoPlayBtn.isHidden = false
        let url = URL(string: post?.content ?? "")
        let player = AVPlayer(url: url!)
        let vc = AVPlayerViewController()
        vc.player = player
        self.present(vc, animated: true) { vc.player?.play() }
    }
    
    @IBAction func openPdfAction(_ sender: Any) {
        pdfHanlder?()
        
    }
}
// MARK: - Table View
extension PostDetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post?.comments?.count ?? 0
    }
    // Data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentsCell", for: indexPath) as! CommentsTableViewCell
        guard let item = post?.comments?[indexPath.row] else { return cell }
        cell.cellConfigure(item: item)
        cell.deleteComment.tag = indexPath.row
        cell.deleteComment.addTarget(self, action: #selector(buttonPressedForDelete), for: .touchUpInside)
        cell.deleteHandelr = {
            let id = item.id
            self.deleteCommentRequest(id: id)
        }
        cell.reportHandler = {
            let id = item.id
            self.reportRequest(id: id)
            let vc  = self.storyboard?.instantiateViewController(identifier: "reportPopUp") as! ReportPopUpViewController
            //vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        cell.openPdfHandler = {
            let content = item.comment
            UIApplication.shared.openURL(URL(string: content ?? "")!)
        }
        return cell
    }
    // Height for row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    @objc func buttonPressedForDelete(_ sender: UIButton){
        post?.comments?.remove(at: sender.tag)
        tableView.deleteRows(at:[IndexPath(row:sender.tag,section:0)],with:.none)
        tableView.reloadData()
    }

    
}
