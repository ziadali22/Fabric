//
//  UserProfileViewController.swift
//  Fabric
//
//  Created by ziad on 09/09/2021.
//

import UIKit

class UserProfileViewController: UIViewController {

    //MARK: - Outlet
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var postsCount: UILabel!
    @IBOutlet weak var answersCount: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var firstCollection: UICollectionView!
    @IBOutlet weak var secondCollection: UICollectionView!
    @IBOutlet weak var secondCollectionViewForComments: UICollectionView!
    @IBOutlet weak var firstCollectionViewForPosts: UICollectionView!
    // localization
    @IBOutlet weak var postsCountTitle: UILabel!
    @IBOutlet weak var answersCountTitle: UILabel!
    @IBOutlet weak var postsTitle: UILabel!
    // MARK: - Variables
    var myposts: [Item]?
    var userProfileData : Item?
    var postId: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        // localization
        postsCountTitle.text = "Posts Count".localized
        answersCount.text = "Answer Count".localized
        postsTitle.text = "Posts".localized
        
        userPhoto.layer.cornerRadius = userImage.frame.height/2
        firstCollection.delegate = self
        firstCollection.dataSource = self
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        firstCollection.collectionViewLayout = layout
        
        userProfileRequest()
        userData()
    }
    @IBAction func dismissBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
// MARK: - CollectionView
extension UserProfileViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myposts?.count ?? 0
    }
    // Data
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "postsCVC", for: indexPath) as! PostsCollectionViewCell
        guard let item = myposts?[indexPath.row]else { return cell }
        cell.addData(item: item)
        return cell
    }
    // Layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: firstCollection.frame.width / 2 - 10, height: 190)
    }
    // DidSelect
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "comments") as! PostDetailViewController
        vc.postId = myposts?[indexPath.row].id
        show(vc, sender: nil)
    }
    
}
