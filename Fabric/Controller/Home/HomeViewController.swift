//
//  HomeViewController.swift
//  Fabric
//
//  Created by ziad on 31/08/2021.
//

import UIKit

class HomeViewController: UIViewController , HomeFilterProtcol {
    // MARK: - Outlet
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var newstPostsCollectionView: UICollectionView!
    @IBOutlet weak var hieghtsRatesCollectionView: UICollectionView!
    @IBOutlet weak var departmentsText: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - Variables
    var postsData : [MostComment]?
    var mostRateData : [MostComment]?
    var commentData : [Comment]?
    var myposts = [Item]()
    var filterData: [Comment]?
    let refreshControl = UIRefreshControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for family: String in UIFont.familyNames {
            print("(family) = \(family)")
            for names: String in UIFont.fontNames(forFamilyName: family) {
                print("== (names)= \(names)")
            }
        }
        
        DispatchQueue.main.async {
            self.tabBarController?.tabBar.items?[3].title = "my posts".localized
            self.tabBarController?.tabBar.items?[4].title = "more".localized
        }
        departmentsText.setTitle("Departments".localized, for: .normal)
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "Group 160"))         
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        searchBar.delegate = self
        // first collection view
        newstPostsCollectionView.delegate = self
        newstPostsCollectionView.dataSource = self
        
        hieghtsRatesCollectionView.delegate = self
        hieghtsRatesCollectionView.dataSource = self
        
        // horizontal collection view direction
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        newstPostsCollectionView.collectionViewLayout = layout
        hieghtsRatesCollectionView.collectionViewLayout = layout
        
        // Networking:
        homePostsCategoriesRequest(category: nil)
        //refresh controller
        refreshControl.addTarget(self, action: #selector(self.networkHomePosts), for: UIControl.Event.valueChanged)
        scrollView.refreshControl = refreshControl
    }
    override func viewWillLayoutSubviews() {
        self.departmentsText.titleLabel?.font = UIFont(name: "PNU-Bold", size: 14)
    }
    @objc func networkHomePosts(){
        homePostsCategoriesRequest(category: nil)
        newstPostsCollectionView.reloadData()
        hieghtsRatesCollectionView.reloadData()
        scrollView.refreshControl?.endRefreshing()
    }
    // MARK: - Actions
    @IBAction func notificationScreen(_ sender: Any) {
        let vc  = storyboard?.instantiateViewController(identifier: "notificationHome") as! NotificationViewController
        show(vc, sender: nil)
    }
    
    @IBAction func DepartmentsPopUpBtn(_ sender: Any) {
        let vc  = storyboard?.instantiateViewController(identifier: "departmentsPopUp") as! HomeDepartmentPopUp
        vc.filterDelegate = self
        present(vc, animated: true, completion: nil)
    }
    
    // MARK: - Filter Delegate
    func passData(data: [Int]) {
        print(data)
        DispatchQueue.main.async {
            self.homePostsCategoriesRequest(category: data)
        }
    }
    
    
}

// MARK: - Home CollectionView
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.newstPostsCollectionView{
            return postsData?.count ?? 0
        }else{
            return mostRateData?.count ?? 0
        }
    }
    // Data
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
    // DidSelect
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyBoard = UIStoryboard.init(name: "Posts", bundle: Bundle.main)
        let vc = storyBoard.instantiateViewController(withIdentifier: "comments") as! PostDetailViewController
        if collectionView == self.newstPostsCollectionView{
            guard let postId = postsData?[indexPath.row].id else { return }
            vc.postId = postId
        }else{
            guard let postId = mostRateData?[indexPath.row].id else { return  }
            vc.postId = postId
        }
        show(vc, sender: nil)
        
    }
    //Layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.newstPostsCollectionView {
            return CGSize(width: newstPostsCollectionView.frame.width / 1.70 - 8 ,height:  225)
        }
        else{
            return CGSize(width: hieghtsRatesCollectionView.frame.width / 1.70 - 8 ,height:  225)
        }
        
        
    }
    
    
    
}
