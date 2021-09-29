//
//  DepartmentsVC.swift
//  Fabric
//
//  Created by ziad on 02/09/2021.
//

import UIKit

class DepartmentsVC: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var underLineBtn: UIView!
    @IBOutlet weak var allDepartmentBtn: UIButton!
    @IBOutlet weak var myDepartmentBtn: UIButton!
    // MARK: - Variables
    var categoryData: myCategory?
    var selectedCategory = [CategoryModel]()
    var allCategories: Bool = true
    let refreshControl = UIRefreshControl()
    var isSearch: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "Group 160"))

        collectionView.dataSource = self
        collectionView.delegate = self
        // add  width
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
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
    override func viewWillAppear(_ animated: Bool) {
        getCategoriesApi()

    }
    @objc func network(){
        collectionView.refreshControl?.endRefreshing()
    }
    
    //MARK: - Swipe Gesture
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

    // MARK: - BUTTON ACTION
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
// MARK: - Department CollectionView
extension DepartmentsVC: UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ///
        if allCategories == true {
            return categoryData?.allCategories?.count ?? 0
        } else {
            return categoryData?.userCategories?.count ?? 0
        }
        
    }
    // Data
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
    // layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 8, height: 150)
    }


}



