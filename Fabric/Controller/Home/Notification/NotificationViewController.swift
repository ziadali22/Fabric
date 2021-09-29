//
//  NotificationViewController.swift
//  Fabric
//
//  Created by ziad on 12/09/2021.
//

import UIKit

class NotificationViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var notificationTableView: UITableView!
    // MARK: - Variables
    var notificationData: [NotificationModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationTableView.delegate = self
        notificationTableView.dataSource = self
        notificationTableView.separatorStyle = .none
        // network request
        NotificationRequest()
    }
    

}

// MARK: - Notification TableView
extension NotificationViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notification", for: indexPath) as! NotificationTableViewCell
        guard let item = notificationData?[indexPath.row
        ] else { return cell }
        cell.configureCell(item: item)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    
}

