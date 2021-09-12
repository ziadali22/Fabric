//
//  postsVC.swift
//  Fabric
//
//  Created by ziad on 05/09/2021.
//

import UIKit
import Kingfisher
class postsVC: UIViewController {

    @IBOutlet weak var collectionview: UICollectionView!
    
    // networking variables  :
    var myposts: [Item]?
    // -----------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // add logo
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "Group 160"))
        
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.collectionViewLayout = UICollectionViewFlowLayout()
        // networking
        myPostsRequest()
        
        
    }
    
    

}
extension postsVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myposts?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "postsCell", for: indexPath) as! postsCVCell
        guard let item = myposts?[indexPath.row]else { return cell }
        cell.postsCvonfigure(item: item)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionview.frame.width / 2 - 10, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "comments") as! PostDetailViewController
        vc.postId = myposts?[indexPath.row].id
        
        show(vc, sender: nil)
    }
    
    
}
