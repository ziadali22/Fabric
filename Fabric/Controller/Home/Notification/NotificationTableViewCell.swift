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
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        dotView.addDashBorder(color: .green, cornerRadius: 3)
    }
    
    func configureCell(item: NotificationModel){
        labelText.text = item.data?.title
    }

}
