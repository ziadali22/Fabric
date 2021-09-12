//
//  MoreVc.swift
//  Fabric
//
//  Created by ziad on 05/09/2021.
//

import UIKit

class MoreVc: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    var titleArr = ["My Account","Language","Rules and Metrices","About us","Contact Us","Log out"]
    
    var imageArr = ["Group 193","Group 194","Group 195","Group 196","Group 197","Group 198"]

    var rowArray = [RowData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "Group 160"))
        tableView.delegate = self
        tableView.dataSource = self
        setArrData()
  
    }
    func setArrData(){
        rowArray.append(RowData(title: "Profile", image: "Group 193", action: {
            let vc = self.storyboard?.instantiateViewController(identifier: "myaccount") as! MyAccountViewController
            vc.modalPresentationStyle = .fullScreen
                self.show(vc, sender: nil)
        }))
        rowArray.append(RowData(title: "Language", image: "Group 194", action: {
            let vc = self.storyboard?.instantiateViewController(identifier: "Language") as! MyAccountViewController
            vc.modalPresentationStyle = .fullScreen
                self.show(vc, sender: nil)
        }))
        rowArray.append(RowData(title: "Terms and conditions", image: "Group 193", action: {
            let vc = self.storyboard?.instantiateViewController(identifier: "terms") as! TermsViewController
            vc.modalPresentationStyle = .fullScreen
                self.show(vc, sender: nil)
        }))
        rowArray.append(RowData(title: "About Us", image: "Group 196", action: {
            let vc = self.storyboard?.instantiateViewController(identifier: "aboutus") as! AboutUsVC
            vc.modalPresentationStyle = .fullScreen
                self.show(vc, sender: nil)
        }))
        rowArray.append(RowData(title: "Contact Us", image: "Group 197", action: {
            let vc = self.storyboard?.instantiateViewController(identifier: "contactus") as! contactUsViewController
            vc.modalPresentationStyle = .fullScreen
                self.show(vc, sender: nil)
        }))
        rowArray.append(RowData(title: "Log Out", image: "Group 198", action: {
            UserDataActions.removeUserModel()
            let vc = self.storyboard?.instantiateViewController(identifier: "signinOrSignup") as! LoginOrSign
            vc.modalPresentationStyle = .fullScreen
                self.show(vc, sender: nil)
        }))
    }
    
    @IBAction func getNotifications(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "notifications") as! NotificationsViewController
        self.show(vc, sender: nil)
        
        }
    
}

extension MoreVc: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "more", for: indexPath) as! moreTVC
        cell.configure(rowArray[indexPath.row].image ?? "", rowArray[indexPath.row].title ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        rowArray[indexPath.row].action!()

    }

}
