//
//  PostDetailViewController.swift
//  Fabric
//
//  Created by ziad on 08/09/2021.
//

import UIKit

class PostDetailViewController: UIViewController {
    
    var titleArr = ["My Account","Language","Rules and Metrices"]
    var commentcont = [12,12,24]
    var imageArr = ["annie-spratt-ORDz1m1-q0I-unsplash","annie-spratt-ORDz1m1-q0I-unsplash","annie-spratt-ORDz1m1-q0I-unsplash"]
    var date = ["22 maarch 2022","22 maarch 2022","22 maarch 2022"]
    var user = [ "ahmed","ahmed","ahmed"]
    var myComments = [ "the first comment","the second ","thie third"]
    var item = [CellData]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    


    @IBAction func addCommentPopUP(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "addCommentPopUp") as! AddCommentPopUpViewController
        
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func reportBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "reportPopUp") as! ReportPopUpViewController
        present(vc, animated: true, completion: nil)
    }
}
extension PostDetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentsCell", for: indexPath) as! CommentsTableViewCell
        cell.cellConfigure(String(commentcont[indexPath.row]), user[indexPath.row], date[indexPath.row], myComments[indexPath.row], imageArr[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}
