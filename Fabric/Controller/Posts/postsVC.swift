//
//  postsVC.swift
//  Fabric
//
//  Created by ziad on 05/09/2021.
//

import UIKit

class postsVC: UIViewController {

    @IBOutlet weak var collectionview: UICollectionView!
    var dumbDataArr = ["Math","Pyhsics","Science","History","Biology"]
    var imageArr = ["annie-spratt-ORDz1m1-q0I-unsplash","jeswin-thomas-guLAk5gqj-Y-unsplash","kuanish-reymbaev-o_lLsdVTxak-unsplash","sebastian-bednarek-x2Z0uNj-Quo-unsplash","sebastian-bednarek-x2Z0uNj-Quo-unsplash"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
    

}
extension postsVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dumbDataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "postsCell", for: indexPath) as! postsCVCell
        cell.postsConfigure(imageArr[indexPath.row], dumbDataArr[indexPath.row], "12", "22 march 2022")
        cell.cellImage.contentMode = .scaleAspectFill
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionview.frame.width / 2 - 10, height: 200)
    }
    
    
    
}
