//
//  HomeViewController.swift
//  Fabric
//
//  Created by ziad on 31/08/2021.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var newstPostsCollectionView: UICollectionView!
    @IBOutlet weak var hieghtsRatesCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "Group 160"))
      //  newstPostsCollectionView.dataSource = self
      //  newstPostsCollectionView.delegate = self
    }
    


}
/*extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}
*/
