//
//  exCollection.swift
//  sabeelUser
//
//  Created by Abulrahman mohsen on 3/21/20.
//  Copyright © 2020 Abulrahman mohsen. All rights reserved.
//

import UIKit
extension UICollectionView {
    func reloadAnimation() {
        self.reloadData()
        self.layoutIfNeeded()
        
        let cells = self.visibleCells
        
        let tableViewHeight = self.bounds.size.height
        
        for (index,cell) in cells.enumerated() {
            
            if (index + 1 + index + 2 + index + 3 + 1 ) == 9 {
                cell.transform = CGAffineTransform(translationX:  -tableViewHeight * 0.5, y: tableViewHeight)
            } else {
                cell.transform = CGAffineTransform(translationX: tableViewHeight * 1.5, y: -tableViewHeight)
            }
        }
        var delayCounter = 0
        for cell in cells{
            UIView.animate(withDuration: 1.75, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
            
        }
    }
    
        func setEmptyView(title: String, message: String? = "" ) {
            let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
            let titleLabel = UILabel()
            let messageLabel = UILabel()
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            messageLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.textColor = UIColor.darkGray
            titleLabel.font = UIFont(name: AppFont.Almarai.Regular.rawValue, size: 17)
            messageLabel.textColor = UIColor.lightGray
            messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
            emptyView.addSubview(titleLabel)
            emptyView.addSubview(messageLabel)
            titleLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
            titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
            messageLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 20).isActive = true
            messageLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -20).isActive = true
            titleLabel.text = title
            messageLabel.text = message
            messageLabel.numberOfLines = 0
            messageLabel.textAlignment = .center
            self.backgroundView = emptyView
        }
        func restore() {
            self.backgroundView = nil
        }
    
}
