//
//  UIScrollView.swift
//  Tomor
//
//  Created by Abulrahman mohsen on 4/26/20.
//  Copyright © 2020 Abulrahman mohsen. All rights reserved.
//

import UIKit
extension UIScrollView {
   func scrollToBottom(animated: Bool) {
     if self.contentSize.height < self.bounds.size.height { return }
     let bottomOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height)
     self.setContentOffset(bottomOffset, animated: animated)
  }
}
