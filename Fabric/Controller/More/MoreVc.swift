//
//  MoreVc.swift
//  Fabric
//
//  Created by ziad on 05/09/2021.
//

import UIKit

class MoreVc: UIViewController {

    
    var titleArr = ["first","Language","Rules and Metrices","About us","Contact Us","Log out"]
    
    var imageArr = ["Group 193","Group 194","Group 195","Group 196","Group 197","Group 198"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//    }


}
