//
//  DepartmentsVC.swift
//  Fabric
//
//  Created by ziad on 02/09/2021.
//

import UIKit

class DepartmentsVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
   
    @IBOutlet weak var underLineBtn: UIView!

    @IBOutlet weak var btn1: UIButton!
    
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var followUnfollowBtn: UIButton!
    
    var categoryData: [CategoryModel]?
    var selectedCategory = [CategoryModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        getCategoriesApi()

        

        
    }
    override func viewWillAppear(_ animated: Bool) {
        getCategoriesApi()
    }
    
    func getCategoriesApi(){
        self.view.showLoader()
        AuthRequestRouter.getCategories.send(BaseModelArray<CategoryModel>.self, then: handleGetResponse)
    }
    var handleGetResponse: HandleResponse<BaseModelArray<CategoryModel>> {
        return { [weak self] (response) in
            guard let self = self else {return}
            self.view.dismissLoader()
            switch response {
            case .failure(let error):
                self.showMessage(sub: error.localizedDescription)
            case .success(let model):
                if model.status{
                    guard let item = model.data else {return}
                    self.categoryData = item
                    self.collectionView.reloadData()
                }else{
                    guard let errorMsg = model.msg else{return}
                    self.showMessage(sub: errorMsg)
                }
                
            }
        }
    }

    @IBAction func allClick(_ sender: Any) {
        UIView.animate(withDuration: 0.7) {
            self.underLineBtn.center.x = self.btn1.center.x
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func myClick(_ sender: Any) {
        UIView.animate(withDuration: 0.7) {
            self.underLineBtn.center.x = self.btn2.center.x
            self.view.layoutIfNeeded()
        }
    }
    @IBAction func followUnfollowBtn(_ sender: Any) {
        
    }
    
}
extension DepartmentsVC: UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryData?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! DepartmentsCVCell
        cell.contentView.layer.cornerRadius = 10
        guard var item = categoryData?[indexPath.row] else { return cell }
        cell.configureCell(item: item)
        cell.followHandeler = {
            if item.isFollowed == true{
                cell.followBtn.setTitle("unFollow", for: .normal)
                item.isFollowed = false
            }else{
                cell.followBtn.setTitle("Follow", for: .normal)
                item.isFollowed = true
            }
            self.Request(id: item.id)
            self.collectionView.reloadData()
        }
        
        cell.DotViewFunc()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 8, height: 150)
    }


}


