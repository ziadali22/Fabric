//
//  notificationTableViewCell.swift
//  Fabric
//
//  Created by ziad on 07/09/2021.
//

import UIKit

class notificationTableViewCell: UITableViewCell {

    @IBOutlet weak var notificationView: UIView!
    @IBOutlet weak var labelText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
        DispatchQueue.main.async {
            self.notificationView.addDashBorder(color: .green, cornerRadius: 3)
        }

    }
    func configureNotificationCell( _ item: NotificationModel){
        labelText.text = item.data?.title
    }
}

