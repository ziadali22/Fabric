//
//  HomeViewController.swift
//  Fabric
//
//  Created by ziad on 31/08/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    var departmentData = ["Math","Pyhsics","Science","History","Biology"]
    var imageArr = ["annie-spratt-ORDz1m1-q0I-unsplash","jeswin-thomas-guLAk5gqj-Y-unsplash","kuanish-reymbaev-o_lLsdVTxak-unsplash","sebastian-bednarek-x2Z0uNj-Quo-unsplash","sebastian-bednarek-x2Z0uNj-Quo-unsplash"]
    
    
    @IBOutlet weak var newstPostsCollectionView: UICollectionView!
    @IBOutlet weak var hieghtsRatesCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "Group 160"))
        
        newstPostsCollectionView.delegate = self
        newstPostsCollectionView.dataSource = self
        
        hieghtsRatesCollectionView.delegate = self
        hieghtsRatesCollectionView.dataSource = self
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
              // horizontal collection view direction
          layout.scrollDirection = .horizontal
        newstPostsCollectionView.collectionViewLayout = layout
        hieghtsRatesCollectionView.collectionViewLayout = layout

    }
    


}
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.newstPostsCollectionView{
            return departmentData.count
        }
        return departmentData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView  == self.newstPostsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newstCell", for: indexPath) as! NewstPostsCVC
            cell.NewstPostConfigure(title: departmentData[indexPath.row
            ], image: imageArr[indexPath.row
            ], comntCount: "16", user: "ziad ali", date: "22 march 2020", txtView: "this text view is generated from text view api for testign the code ")
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rateCell", for: indexPath) as! HighestRatePostsCVC
        cell.rateConfigure(departmentData[indexPath.row
        ], imageArr[indexPath.row
        ], "16", "ziad ali", "22 march 2020", txtView: "this text view is generated from text view api for testign the code ")
        cell.rateCellImage.contentMode = .scaleAspectFill
        return cell
        
        
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

