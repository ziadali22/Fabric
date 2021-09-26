//
//  HomeDepartmentPopUp.swift
//  Fabric
//
//  Created by ziad on 22/09/2021.
//

import UIKit
import SkyFloatingLabelTextField
import TTGTags
class HomeDepartmentPopUp: UIViewController , TTGTextTagCollectionViewDelegate{
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var dotViewBtn: UIView!
    
    var categoryData: [CategoryModel]?
    let collectionViewTag = TTGTextTagCollectionView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDepartmentsRequest()
        dotViewBtn.addDashBorder(color: .white, cornerRadius: 3)
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.estimatedItemSize = CGSize(width: collectionView.frame.width, height: 100)
//
//        let tagView = TTGTextTagCollectionView.init(frame: CGRect.init(x: 0, y: 50, width: UIScreen.main.bounds.width - 32, height: 300))
//        tagView.backgroundColor = UIColor.lightGray
//        self.view.addSubview(tagView)
//
//        let strings = ["AutoLayout", "dynamically", "calculates", "the", "size", "and", "position",
//                       "of", "all", "the", "views", "in", "your", "view", "hierarchy", "based",
//                       "on", "constraints", "placed", "on", "those", "views"]
//
//        for text in strings {
//            let content = TTGTextTagStringContent.init(text: text)
//            content.textColor = UIColor.black
//            content.textFont = UIFont.boldSystemFont(ofSize: 20)
//
//            let normalStyle = TTGTextTagStyle.init()
//            normalStyle.backgroundColor = UIColor.white
//            normalStyle.extraSpace = CGSize.init(width: 8, height: 8)
//
//            let selectedStyle = TTGTextTagStyle.init()
//            selectedStyle.backgroundColor = UIColor.green
//            selectedStyle.extraSpace = CGSize.init(width: 8, height: 8)
//
//            let tag = TTGTextTag.init()
//            tag.content = content
//            tag.style = normalStyle
//            tag.selectedStyle = selectedStyle
//            tagView.addTag(tag)
//        }
//        tagView.reload()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 5
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        self.collectionView.collectionViewLayout = layout
        
    }
    

    override func viewDidAppear(_ animated: Bool) {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.reloadData()
    }

    @IBAction func dismissPopUP(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    
}

extension HomeDepartmentPopUp: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return categoryData?.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "departmentCell", for: indexPath) as! HomeDepartmentPopUpCell
        cell.departmentsLabel.text = categoryData?[indexPath.row].name

        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let newWidth = categoryData?[indexPath.row].name?.calculateHeightForString().width
        return CGSize(width: newWidth ?? 90 + 4,height:  40)
        }

    
    


}

