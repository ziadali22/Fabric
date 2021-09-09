//
//  UserProfileViewController.swift
//  Fabric
//
//  Created by ziad on 09/09/2021.
//

import UIKit

class UserProfileViewController: UIViewController {

    //MARK: - outlet
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var postsCount: UILabel!
    @IBOutlet weak var answersCount: UILabel!
    
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var firstCollection: UICollectionView!
    @IBOutlet weak var secondCollection: UICollectionView!
    // MARK: - variables
    var myposts: [Item]?
    var userProfileData : Item?
    
    var postId: Int?
    
    var titleArr = ["My Account","Language","Rules and Metrices","About us","Contact Us","Log out"]
    
    var imageArr = ["Group 193","Group 194","Group 195","Group 196","Group 197","Group 198"]
    
    
    @IBOutlet weak var secondCollectionViewForComments: UICollectionView!
    @IBOutlet weak var firstCollectionViewForPosts: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userPhoto.layer.cornerRadius = userImage.frame.height/2
        firstCollection.delegate = self
        firstCollection.dataSource = self
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        firstCollection.collectionViewLayout = layout
        userProfileRequest()
        userData()
    }
    @IBAction func dismissBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    

}
extension UserProfileViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myposts?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "postsCVC", for: indexPath) as! PostsCollectionViewCell
        guard let item = myposts?[indexPath.row]else { return cell }
        cell.addData(item: item)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: firstCollection.frame.width / 2 - 10, height: 190)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "comments") as! PostDetailViewController
        vc.postId = myposts?[indexPath.row].id
        show(vc, sender: nil)
    }
    
}
