//
//  HomeViewController.swift
//  Fabric
//
//  Created by ziad on 31/08/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: dumb data will replace with api data
    var departmentData = ["Math","Pyhsics","Science","History","Biology"]
    var imageArr = ["annie-spratt-ORDz1m1-q0I-unsplash","jeswin-thomas-guLAk5gqj-Y-unsplash","kuanish-reymbaev-o_lLsdVTxak-unsplash","sebastian-bednarek-x2Z0uNj-Quo-unsplash","sebastian-bednarek-x2Z0uNj-Quo-unsplash"]
    
    
    
    
    // ---------------
    // first collection view
    @IBOutlet weak var newstPostsCollectionView: UICollectionView!
    // second collection view
    @IBOutlet weak var hieghtsRatesCollectionView: UICollectionView!
    var postsData : [MostComment]?
    var mostRateData : [MostComment]?
    var myposts : [Item]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // add logo
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "Group 160"))
        // first collection view
        newstPostsCollectionView.delegate = self
        newstPostsCollectionView.dataSource = self
        // second collection view
        hieghtsRatesCollectionView.delegate = self
        hieghtsRatesCollectionView.dataSource = self
        
        // horizontal collection view direction
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        newstPostsCollectionView.collectionViewLayout = layout
        hieghtsRatesCollectionView.collectionViewLayout = layout
        
        // Networking:
        homePostsCategoriesRequest()
        
        
        
    }
    @IBAction func notificationScreen(_ sender: Any) {
        let vc  = storyboard?.instantiateViewController(identifier: "notificationHome") as! NotificationViewController
        show(vc, sender: nil)
    }
    


}
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.newstPostsCollectionView{
            return postsData?.count ?? 0
        }else{
            return mostRateData?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView  == self.newstPostsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newstCell", for: indexPath) as! NewstPostsCVC
            
            guard let item = postsData?[indexPath.row] else { return cell }
            cell.NewstPostConfigure(item: item)
            
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rateCell", for: indexPath) as! HighestRatePostsCVC
            guard let item = mostRateData?[indexPath.row] else { return cell}
            cell.rateConfigure(item: item)
            cell.rateCellImage.contentMode = .scaleAspectFill
            return cell
        }
        

       
        
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
 
        let storyBoard = UIStoryboard.init(name: "Posts", bundle: Bundle.main)
        let vc = storyBoard.instantiateViewController(withIdentifier: "comments") as! PostDetailViewController
        if collectionView == self.newstPostsCollectionView{
            guard let postId = postsData?[indexPath.row].id else { return  }
            vc.postId = postId
        }else{
            guard let postId = mostRateData?[indexPath.row].id else { return  }
            vc.postId = postId
        }
        show(vc, sender: nil)
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.newstPostsCollectionView {
            return CGSize(width: newstPostsCollectionView.frame.width / 1.70 - 8 ,height:  225)
        }
        else{
            return CGSize(width: hieghtsRatesCollectionView.frame.width / 1.70 - 8 ,height:  225)
        }

        
        }


    
}

