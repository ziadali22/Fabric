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
    // all department
    @IBOutlet weak var allDepartmentBtn: UIButton!
    // my department
    @IBOutlet weak var myDepartmentBtn: UIButton!
    // make variabel to store date back from api to use it in collection view
    var categoryData: myCategory?
    var selectedCategory = [CategoryModel]()
    
    // used to show the all or my categories
    
    var allCategories: Bool = true
    
    
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // add logo
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "Group 160"))

        collectionView.dataSource = self
        collectionView.delegate = self
        // add  width 
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        // network get categories from api
        //getCategoriesApi()
        
        // MARK: swipe gesture
        collectionView.isUserInteractionEnabled = true
        let swipeRieght = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture))
        swipeRieght.direction = UISwipeGestureRecognizer.Direction.right
        collectionView.addGestureRecognizer(swipeRieght)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        collectionView.addGestureRecognizer(swipeLeft)
        
        
        //refresh controller
        refreshControl.addTarget(self, action: #selector(self.network), for: UIControl.Event.valueChanged)
        collectionView.refreshControl = refreshControl
    }

    @objc func network(){
        
        getCategoriesApi()
        collectionView.refreshControl?.endRefreshing()
    }

    @objc func swipeGesture(sender: UISwipeGestureRecognizer?){
        if let swipeGesture = sender {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left:
                ///
                allCategories = false
                self.collectionView.reloadData()
                UIView.animate(withDuration: 0.7) {
                    self.underLineBtn.center.x = self.myDepartmentBtn.center.x
                    self.view.layoutIfNeeded()
                }
            case UISwipeGestureRecognizer.Direction.right:
                ///
                allCategories = true
                self.collectionView.reloadData()
                UIView.animate(withDuration: 0.7) {
                    self.underLineBtn.center.x = self.allDepartmentBtn.center.x
                    self.view.layoutIfNeeded()
                    
                }
            default:
                break
            }
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        getCategoriesApi()
    }
    
    func getCategoriesApi(){
        self.view.showLoader()
        AuthRequestRouter.myCategories.send(BaseModel<myCategory>.self, then: handleGetResponse)
    }
    var handleGetResponse: HandleResponse<BaseModel<myCategory>> {
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
        ///
        allCategories = true
        self.collectionView.reloadData()
        UIView.animate(withDuration: 0.7) {
            self.underLineBtn.center.x = self.allDepartmentBtn.center.x
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func myClick(_ sender: Any) {
        ///
        allCategories = false
        self.collectionView.reloadData()
        UIView.animate(withDuration: 0.7) {
            self.underLineBtn.center.x = self.myDepartmentBtn.center.x
            self.view.layoutIfNeeded()
        }
    }

    @IBAction func getNotifications(_ sender: Any) {
        let vc  = storyboard?.instantiateViewController(identifier: "notificationHome") as! NotificationViewController
        show(vc, sender: nil)
    
    }
    
}
extension DepartmentsVC: UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ///
        if allCategories == true {
            return categoryData?.allCategories?.count ?? 0
        } else {
            return categoryData?.userCategories?.count ?? 0
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! DepartmentsCVCell
        cell.contentView.layer.cornerRadius = 10
        if allCategories == true {
              guard let item = categoryData?.allCategories?[indexPath.row] else { return cell }
              cell.configureCellForDepartment(item: item)
              cell.followHandeler = {
                  self.Request(id: item.id)
                 
              }
          }else{
            guard let item = categoryData?.userCategories?[indexPath.row] else {return cell}
            cell.configureCellForDepartment(item: item)
            cell.followHandeler = {
                self.Request(id: item.id)
            }
        }
        cell.DotViewFunc()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 8, height: 150)
    }


}


