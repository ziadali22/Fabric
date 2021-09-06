//
//  MoreVc.swift
//  Fabric
//
//  Created by ziad on 05/09/2021.
//

import UIKit

class MoreVc: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    var titleArr = ["first","Language","Rules and Metrices","About us","Contact Us","Log out"]
    
    var imageArr = ["Group 193","Group 194","Group 195","Group 196","Group 197","Group 198"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // add logo
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "Group 160"))
        
        tableView.delegate = self
        tableView.dataSource = self
        
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
    
   /* func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }*/
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 5{
            UserDataActions.removeUserModel()
            let vc = storyboard?.instantiateViewController(identifier: "signinOrSignup") as! LoginOrSign
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
    }

}
