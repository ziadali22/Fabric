//
//  NotificationTableViewCell.swift
//  Fabric
//
//  Created by ziad on 12/09/2021.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    // MARK: - Outlet
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var dotView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(item: NotificationModel){
        labelText.text = item.data?.title
        DispatchQueue.main.async {
            self.dotView.addDashBorder(color: .systemGreen, cornerRadius: 3)
        }
    }

}
