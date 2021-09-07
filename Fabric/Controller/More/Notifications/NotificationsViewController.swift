//
//  NotificationsViewController.swift
//  Fabric
//
//  Created by ziad on 07/09/2021.
//

import UIKit

class NotificationsViewController: UIViewController {

    
    var notificationData = [NotificationModel]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        print(notificationData)
        
        
        notificationResponse()
    }
    



}
extension NotificationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notificationCell", for: indexPath) as! notificationTableViewCell
        cell.configureNotificationCell(notificationData[indexPath.row])
        return cell
    }
    
    
}
