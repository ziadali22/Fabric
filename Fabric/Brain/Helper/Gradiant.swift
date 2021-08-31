//
//  Gradiant.swift
//  Ter7al
//
//  Created by mohab on 19/05/2021.
//

import Foundation
import UIKit
extension UIView {
func applyGradient(withColours colours: [UIColor], locations: [NSNumber]? = nil) {
    let gradient: CAGradientLayer = CAGradientLayer()
    gradient.frame = self.bounds
    gradient.colors = colours.map { $0.cgColor }
    gradient.locations = locations
    self.layer.insertSublayer(gradient, at: 0)
}
}
