//
//  StyleUIView.swift
//  sabeelUser
//
//  Created by Abulrahman mohsen on 3/21/20.
//  Copyright © 2020 Abulrahman mohsen. All rights reserved.
//

import UIKit
class StyleUIView: UIView {
    
    func applyStyle() {
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        applyStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        applyStyle()
    }
    
    
}


/*class StyleGradiantCorner : StyleUIView {
 var gradientLayer:CAGradientLayer = CAGradientLayer()
 
 override func applyStyle() {
 self.layer.cornerRadius = CGFloat(10)
 self.layer.masksToBounds = true
 // gradientLayer.frame.size = self.frame.size
 gradientLayer.frame = self.bounds
 gradientLayer.colors =
 [AppColor.Green.cgColor,AppColor.GreenLight.cgColor]
 gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
 self.layer.insertSublayer(gradientLayer, at: 0)
 
 
 }
 override func layoutSubviews() {
 super.layoutSubviews()
 gradientLayer.frame = self.bounds
 layoutIfNeeded()
 }
 }
 class StyleGradiant : StyleUIView {
 var gradientLayer:CAGradientLayer = CAGradientLayer()
 override func applyStyle() {
 
 gradientLayer.frame = self.bounds
 gradientLayer.colors =
 [AppColor.Green.cgColor,AppColor.GreenLight.cgColor]
 gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
 self.layer.insertSublayer(gradientLayer, at: 0)
 
 }
 
 override func layoutSubviews() {
 super.layoutSubviews()
 gradientLayer.frame = self.bounds
 layoutIfNeeded()
 }
 
 }
 */

extension UIView {
    func addDashBorder(color:UIColor? = .white, cornerRadius: CGFloat? = 3) {
        let sendedColor = color ?? .white
        let color = sendedColor.cgColor

        let shapeLayer:CAShapeLayer = CAShapeLayer()

        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)

        shapeLayer.bounds = shapeRect
        shapeLayer.name = "DashBorder"
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = 1.5
        shapeLayer.lineJoin = .round
        shapeLayer.lineDashPattern = [2,4]
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: cornerRadius ?? 3).cgPath

        self.layer.masksToBounds = false

        self.layer.addSublayer(shapeLayer)
    }
}
