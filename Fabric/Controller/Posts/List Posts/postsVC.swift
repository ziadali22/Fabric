//
//  postsVC.swift
//  Fabric
//
//  Created by ziad on 05/09/2021.
//
import Foundation
import UIKit
import Kingfisher
class postsVC: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var postVcSearchBar: UISearchBar!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var notificationsBtn: UIButton!
    @IBOutlet weak var searchBarHeight: NSLayoutConstraint!
    // MARK: - Variables
    var myposts = [Item]()
    var myComments : [Comment]?
    var deletId : Item?
    var postId: Int?
    var searchText: String?
    let refreshControlTwo = UIRefreshControl()
    var isSearch: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        searchBar.delegate = self
        // add logo
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "Group 160"))
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.collectionViewLayout = UICollectionViewFlowLayout()
        searchBar.isHidden = true
        notificationsBtn.isHidden = true
        searchBarHeight.constant = 0
    }

    // MARK: - Check if it search or not
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if isSearch == false{
            DispatchQueue.main.async {
                self.searchBar.isHidden = false
                self.notificationsBtn.isHidden = false
                self.searchBarHeight.constant = 50
                self.myPostsRequest()
            }
            //refresh controller
            refreshControlTwo.addTarget(self, action: #selector(self.networkPostRequest), for: UIControl.Event.valueChanged)
            scrollView.refreshControl = refreshControlTwo
        }
        collectionview.reloadData()
    }
    @objc func networkPostRequest(){
        DispatchQueue.main.async {
            self.myPostsRequest()
        }
        collectionview.refreshControl?.endRefreshing()
    }

    @IBAction func getNotifications(_ sender: Any) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let vc = storyBoard.instantiateViewController(identifier: "notificationHome") as! NotificationViewController
        self.show(vc, sender: nil)
    }
    
    
}
// MARK: - Collection View
extension postsVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myposts.count
    }
    // Data
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "postsCell", for: indexPath) as! postsCVCell
        if isSearch == false{
            cell.deletePostOutlet.isHidden = false
        }else{
            cell.deletePostOutlet.isHidden = true
        }
        
        let item = myposts[indexPath.row]
        cell.postsCvonfigure(item: item)
        cell.deletePostOutlet.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        postId = myposts[indexPath.row].id
        cell.deletePostClosure = {
            let id = item.id
            self.deleteRequest(item: id)
        }
        return cell
    }
    // Layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionview.frame.width / 2 - 10, height: 200)
    }
    // DidSelect
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "comments") as! PostDetailViewController
        vc.postId = myposts[indexPath.row].id
        show(vc, sender: nil)
        
    }
    @objc func buttonPressed(){
        myPostsRequest()
        collectionview.reloadData()
    }
    
    
}

