//
//  NotificationsViewController.swift
//  Fabric
//
//  Created by ziad on 07/09/2021.
//

import UIKit

class NotificationsViewController: UIViewController {

    @IBOutlet weak var notificationTableView: UITableView!
    
    var notificationData: [NotificationModel]?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        notificationTableView.dataSource = self
        notificationTableView.delegate = self
        notificationTableView.separatorStyle = .none
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        notificationResponse()
        notificationTableView.reloadData()
    }



}
extension NotificationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notificationCell", for: indexPath) as! notificationTableViewCell
        guard let item = notificationData?[indexPath.row
        ] else { return cell }
        cell.configureNotificationCell(item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}
