//
//  extentionView.swift
//  sabeelUser
//
//  Created by Abulrahman mohsen on 3/21/20.
//  Copyright © 2020 Abulrahman mohsen. All rights reserved.
//

import UIKit
//@IBDesignable
extension UIView{
        func roundCorners(_ corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
      }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func calculateTimeBetweenDates(_ start : String ,_ end : String) -> DateComponents{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let Startdate = dateFormatter.date(from:start)!
        let EndDate = dateFormatter.date(from:end)!
        let components = Set<Calendar.Component>([.month, .year])
        return  Calendar.current.dateComponents(components, from: Startdate, to: EndDate)
    }
    
    func setShadow(width : Int , height: Int , shadowRadius: CGFloat , shadowOpacity: Float , shadowColor: CGColor){
           // to make the shadow with rounded corners and offset shadow form the bottom
           self.layer.shadowColor = shadowColor
           self.layer.shadowOffset = CGSize(width: width, height: height)
           self.layer.shadowRadius = shadowRadius
           self.layer.shadowOpacity = shadowOpacity
           self.clipsToBounds = true
           self.layer.masksToBounds = false
         }
    
    func setBottomLine(bottomColor : UIColor) {
        
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = bottomColor.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    
    func setGradientColor(colors : [CGColor]) {
        let layer : CAGradientLayer = CAGradientLayer()
        layer.frame.size = self.frame.size

        layer.colors = colors
        
        self.layer.insertSublayer(layer, at: 0)
    }
    func BottomColorShadow(txtBackground : UIColor , bottomColor : UIColor ){
        self.layer.backgroundColor = txtBackground.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = bottomColor.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    func SetCustomShadowColor(shadowColor : CGColor?){
        self.layer.shadowOffset = CGSize(width: 8, height: 9)
        self.layer.shadowColor = shadowColor ?? #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 20
    }
    func layerShadowCorner(_corner : CGFloat = 5 , _height : CGFloat = 8){
        self.layer.cornerRadius = _corner
        self.layer.shadowOffset = CGSize(width: 0, height: _height)
        self.layer.shadowColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)//UIColor(red:0, green:0, blue:0, alpha:0.24).cgColor
        self.layer.shadowOpacity = 2
        self.layer.shadowRadius = 13
        
    }
    func layerShadow(){
        self.layer.shadowOffset = CGSize(width: 0, height: 9)
        self.layer.shadowColor = UIColor(red:0, green:0, blue:0, alpha:0.24).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 13
        self.layer.masksToBounds = false
    }
    func layerShadowRight(_width : Int = -4 , _height : Int = 4){
        self.layer.shadowOffset = CGSize(width: _width, height: _height)
        self.layer.shadowColor = #colorLiteral(red: 1, green: 0.8235294118, blue: 0.3215686275, alpha: 1)
        self.layer.shadowOpacity = 5.0
        self.layer.shadowRadius = 3.0
        self.layer.masksToBounds = false
    }
   
  
    func layerShadowLeft(_width : Int = 2 , _Height : Int = -2){
        self.layer.shadowOffset = CGSize(width: _width, height: _Height)
        self.layer.shadowColor = #colorLiteral(red: 0.8941176471, green: 0.8941176471, blue: 0.8941176471, alpha: 1)
        self.layer.shadowOpacity = 3.0
        self.layer.shadowRadius = 3.0
        self.layer.masksToBounds = false
    }
    func leyerShadowBottom() {
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        self.layer.shadowOpacity = 3.0
        self.layer.shadowRadius = 3.5
    }
    @IBInspectable
     var leftRoundedRadius: CGFloat {
         get {
             return layer.cornerRadius
         }
         set {
             layer.cornerRadius = newValue
             layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
             layoutIfNeeded()
         }
     }

    @IBInspectable var Rotation : CGFloat{
        get{
            return CGFloat()
        }
        set{
            self.transform = CGAffineTransform(rotationAngle: newValue / 180.0 * CGFloat.pi)
            self.updateConstraints()
  
        }
    }
    @IBInspectable var cornerRadius : CGFloat{
        get{
            return CGFloat()
        }set{
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = true
        }
    }
    @IBInspectable var borderwidth : CGFloat{
        get{
            return CGFloat()
        }set{
            self.layer.borderWidth = newValue
            self.layer.masksToBounds = true
        }
    }
    @IBInspectable var borderColor : UIColor{
        get{
            return UIColor()
        }set{
            self.layer.borderColor = newValue.cgColor
            self.layer.masksToBounds = true
        }
    }
}
class AnimateView : ActivityView{
    enum Direction : String {
        case fromLeft
        case fromRight
        case fromTop
        case fromBottom
        
    }
    var spaceAnimate : CGFloat = 20
    // var direction : Direction = .fromTop
    func startAnimate(direction : Direction = .fromTop ,duration : Double? = 1.5,SpaceAnimate : CGFloat? = 20,springDump : CGFloat? = 20 , initalSpring : CGFloat? = 5,AlphaDuration : Double? = 1){
        spaceAnimate = SpaceAnimate ?? 20
        initAnim(direction: direction)
        
        UIView.animate(withDuration: duration ?? 1.5, delay: 0.0, usingSpringWithDamping: springDump ?? 20, initialSpringVelocity: initalSpring ?? 5, options: .curveEaseOut, animations: {
            if let mySuperView = self.superview{
                switch direction {
                case .fromLeft:
                    self.center.x += mySuperView.bounds.width
                    
                case .fromRight:
                    self.center.x -= mySuperView.bounds.width
                    
                case .fromTop:
                    self.center.y += self.spaceAnimate
                    
                case .fromBottom:
                    self.center.y -= self.spaceAnimate
                    
                }
            }
        }, completion: nil)
        UIView.animate(withDuration: AlphaDuration ?? 1.0) {
                            self.alpha = 1

        }
        
    }
    private func initAnim(direction : Direction){
        if let mySuperView = self.superview{
            switch direction {
                
            case .fromLeft:
                self.center.x -= mySuperView.bounds.width
                
            case .fromRight:
                self.center.x += mySuperView.bounds.width
                
            case .fromTop:
                self.center.y -= spaceAnimate
                
            case .fromBottom:
                self.center.y += spaceAnimate
                
            }
        }
    }
}
enum LINE_POSITION {
    case LINE_POSITION_TOP
    case LINE_POSITION_BOTTOM
}

extension UIView {
    func addLine(position : LINE_POSITION, color: UIColor, width: Double) {
        let lineView = UIView()
        lineView.backgroundColor = color
        lineView.translatesAutoresizingMaskIntoConstraints = false // This is important!
        self.addSubview(lineView)

        let metrics = ["width" : NSNumber(value: width)]
        let views = ["lineView" : lineView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[lineView]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))

        switch position {
        case .LINE_POSITION_TOP:
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lineView(width)]", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        case .LINE_POSITION_BOTTOM:
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lineView(width)]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        }
    }
}
