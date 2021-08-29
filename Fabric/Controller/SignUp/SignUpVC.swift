//
//  SignUpVC.swift
//  Fabric
//
//  Created by ziad on 29/08/2021.
//

import UIKit

class SignUpVC: UIViewController {
    @IBOutlet weak var collectionViwe: UICollectionView!
    
    @IBOutlet weak var DotView: UIView!
    let images = ["Group 509","Group 509","Group 509"]
    let label = ["physics", "science", "math"]
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViwe.dataSource = self
        collectionViwe.delegate = self
        
        DotView.addDashBorder(color: .white, cornerRadius: 3)
    }
    


}
extension SignUpVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SignUpCVC
        cell.contentView.layer.cornerRadius = 10
        cell.labelButton.text = "name"
        return cell
    }
    
    
}
