//
//  HomeDepartmentPopUp.swift
//  Fabric
//
//  Created by ziad on 22/09/2021.
//

import UIKit
import SkyFloatingLabelTextField

class HomeDepartmentPopUp: UIViewController {
    // MARK: - Outlet
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var dotViewBtn: UIView!
    @IBOutlet weak var departmetnsTitle: UIButton!
    @IBOutlet weak var filterPosts: LoadingButton!
    // MARK: - Variables
    var categoryData: [CategoryModel]?
    var selectedDepartment = [Int]()
    var arrSelectedIndex = [IndexPath]()
    var filterDelegate: HomeFilterProtcol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let categories = UserDataActions.getUserModel()?.categories
        departmetnsTitle.setTitle("Departments".localized, for: .normal)
        dotViewBtn.addDashBorder(color: .white, cornerRadius: 3)
        collectionView.allowsMultipleSelection = true
        // network request
        DispatchQueue.main.async {
            self.getDepartmentsRequest()
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.reloadData()
    }

    @IBAction func dismissPopUP(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func filterPostsAction(_ sender: Any) {
        filterDelegate?.passData(data: selectedDepartment)
        dismiss(animated: true, completion: nil)
    }
    
    
}
// MARK: - Department PopUp
extension HomeDepartmentPopUp: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryData?.count ?? 0
    }
    //Data
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "departmentCell", for: indexPath) as! HomeDepartmentPopUpCell
        cell.departmentsLabel.text = categoryData?[indexPath.row].name
        cell.selectedBackgroundView = UIView(frame: cell.bounds)
        cell.selectedBackgroundView!.backgroundColor = .systemGreen
        
        cell.addToArray = {
            guard let item = self.categoryData?[indexPath.row].id else { return }
            self.selectedDepartment.append(item)
            print(self.selectedDepartment)
        }
        cell.removeFromArray = {
            guard let item = self.categoryData?[indexPath.row].id else { return }
            if let index = self.selectedDepartment.firstIndex(of: item) {
                self.selectedDepartment.remove(at: index)
            }
            print(self.selectedDepartment)
        }
        return cell
    }
    // layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let newWidth = categoryData?[indexPath.row].name.calculateHeightForString().width ?? 40 + 20
        return CGSize(width: newWidth  ,height:  60)

        }
    

    


}




