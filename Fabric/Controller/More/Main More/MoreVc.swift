//
//  MoreVc.swift
//  Fabric
//
//  Created by ziad on 05/09/2021.
//

import UIKit
import Foundation
import SwiftUI

class MoreVc: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var rowArray = [RowData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        searchBar.delegate = self
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "Group 160"))
        tableView.delegate = self
        tableView.dataSource = self
        
        setArrData()
  
    }
     func setArrData(){
         rowArray.append(RowData(title: "Profile".localized, image: "Group 193", action: {
            let vc = self.storyboard?.instantiateViewController(identifier: "myaccount") as! MyAccountViewController
            vc.modalPresentationStyle = .fullScreen
                self.show(vc, sender: nil)
        }))
         rowArray.append(RowData(title: "Language".localized, image: "Group 194", action: {
             let refreshAlert = UIAlertController(title: "Change app language".localized, message: "App will Restart".localized, preferredStyle: .alert)

             refreshAlert.addAction(UIAlertAction(title: "confirm", style: .default, handler: { (action: UIAlertAction!) in
                 changeLanguage()
               }))

             refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: { (action: UIAlertAction!) in
                 refreshAlert.dismiss(animated: true, completion: nil)
               }))

             func changeLanguage(){
                 if Language.currentLanguage() == "en"{
                     Language.setAppLanguage(lang: "ar")
                     exit(0)
                 }else{
                     Language.setAppLanguage(lang: "en")
                     exit(0)
                 }
             }

             self.present(refreshAlert, animated: true, completion: nil)
        }))
         rowArray.append(RowData(title: "Terms and conditions".localized, image: "Group 193", action: {
            let vc = self.storyboard?.instantiateViewController(identifier: "terms") as! TermsViewController
            vc.modalPresentationStyle = .fullScreen
                self.show(vc, sender: nil)
        }))
         rowArray.append(RowData(title: "About Us".localized, image: "Group 196", action: {
            let vc = self.storyboard?.instantiateViewController(identifier: "aboutus") as! AboutUsVC
            vc.modalPresentationStyle = .fullScreen
                self.show(vc, sender: nil)
        }))
         rowArray.append(RowData(title: "Contact Us".localized, image: "Group 197", action: {
            let vc = self.storyboard?.instantiateViewController(identifier: "contactus") as! contactUsViewController
            vc.modalPresentationStyle = .fullScreen
                self.show(vc, sender: nil)
        }))
         rowArray.append(RowData(title: "Log Out".localized, image: "Group 198", action: {
            UserDataActions.removeUserModel()
            let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
            let vc = storyBoard.instantiateViewController(identifier: "signinOrSignup") as! LoginOrSign
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }))
        
    }
    
    @IBAction func getNotifications(_ sender: Any) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let vc = storyBoard.instantiateViewController(identifier: "notificationHome") as! NotificationViewController
        self.show(vc, sender: nil)
        
        
        }
    
}
// MARK: TableView
extension MoreVc: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowArray.count
    }
 //Data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "more", for: indexPath) as! moreTVC
        cell.configure(rowArray[indexPath.row].image ?? "", rowArray[indexPath.row].title ?? "")
        return cell
    }
    //DidSelect
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rowArray[indexPath.row].action!()
    }
    // space from top
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 4
    }

}


