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
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var postVcSearchBar: UISearchBar!
    
    // networking variables  :
    var myposts = [Item]()
    var myComments : [Comment]?
    var deletId : Item?
    var postId: Int?
    var searchText: String?
    var deletedPost : Bool = false
    
    // refresh Controll
    let refreshControlTwo = UIRefreshControl()
    
    // -----------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // add logo
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "Group 160"))
        
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.collectionViewLayout = UICollectionViewFlowLayout()
        // networking
        DispatchQueue.main.async {
            self.myPostsRequest()
        }
        
        //refresh controller
        refreshControlTwo.addTarget(self, action: #selector(self.networkPostRequest), for: UIControl.Event.valueChanged)
        scrollView.refreshControl = refreshControlTwo
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myPostsRequest()
        collectionview.reloadData()
    }
    
    @objc func networkPostRequest(){
        DispatchQueue.main.async {
            self.myPostsRequest()
        }
        collectionview.refreshControl?.endRefreshing()
    }
    
    
    
    
    //deleteRequest(item: postId)
    
    
    
    
}
extension postsVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myposts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "postsCell", for: indexPath) as! postsCVCell
        //guard let item = myposts[indexPath.row] else { return cell }
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
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionview.frame.width / 2 - 10, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "comments") as! PostDetailViewController
        vc.postId = myposts[indexPath.row].id
        show(vc, sender: nil)
    }
    
    @objc func buttonPressed(){
        myPostsRequest()
        collectionview.reloadData()
    }
    
    // MARK: - delete post
    func deleteRequest(item:Int?){
        
        AuthRequestRouter.deletePost(id: item ?? 0).send(StringModel.self, then: deleteHandleResponse)
    }
    
    var deleteHandleResponse: HandleResponse<StringModel> {
        return { [weak self] (response) in
            guard let self = self else {return}
            
            switch response {
            case .failure(let error):
                self.showMessage(sub: error.localizedDescription)
            case .success(let model):
                self.collectionview.reloadData()
                if model.status{
                    guard let item = model.data else {return}
                    self.sucess(item: item)
                }else{
                    guard let errorMsg = model.msg else{return}
                    self.showMessage(sub: errorMsg)
                }
                
            }
        }
    }
    func sucess(item: String){
        self.showMessage(sub: "Post Deleted")
        collectionview.reloadData()
    }
    
}
