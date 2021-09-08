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
        // add logo
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "Group 160"))
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    @IBAction func getNotifications(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "notifications") as! NotificationsViewController
        self.show(vc, sender: nil)
        
        }
    
}

extension MoreVc: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "more", for: indexPath) as! moreTVC
        cell.configure(imageArr[indexPath.row], titleArr[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch  indexPath.row {
        case 0 :
            
            let vc = storyboard?.instantiateViewController(identifier: "myaccount") as! MyAccountViewController
            vc.modalPresentationStyle = .fullScreen
                self.show(vc, sender: nil)

        case  3 :
        let vc = storyboard?.instantiateViewController(identifier: "aboutus") as! AboutUsVC
            self.show(vc, sender: nil)
        case  4 :
        let vc = storyboard?.instantiateViewController(identifier: "contactus") as! contactUsViewController
        vc.modalPresentationStyle = .fullScreen
            self.show(vc, sender: nil)
        case 5:
            UserDataActions.removeUserModel()
            let vc = storyboard?.instantiateViewController(identifier: "signinOrSignup") as! LoginOrSign
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        default:
            return
        }

    }

}
