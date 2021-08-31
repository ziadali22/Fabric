//
//  exViewController.swift
//  sabeelUser
//
//  Created by Abulrahman mohsen on 3/21/20.
//  Copyright © 2020 Abulrahman mohsen. All rights reserved.
//

import UIKit
import SwiftMessages
import MapKit
extension UIViewController{
    //======NavBtns===
    func setNavNotification(){
        self.navigationItem.setRightBarButton(setNotificationNavBtn(), animated: true)
    }
    func setNavAddServise(){
        self.navigationItem.setRightBarButton(setAddServiseNavBtn(), animated: true)
    }
    func setNavEditProfile(){
        self.navigationItem.setRightBarButton(setEditProfileNavBtn(), animated: true)
    }
    func setNavFilter(){
        self.navigationItem.setRightBarButton(setFilterNavBtn(), animated: true)
    }
    private func setEditProfileNavBtn()-> UIBarButtonItem{
        let btn2 = UIButton(type: .custom)
        btn2.setTitle("Edit Profile".localized, for: .normal)
        btn2.tintColor = AppColor.gren
        btn2.setTitleColor(AppColor.gren, for: .normal)
        btn2.titleLabel?.font = UIFont(name: AppFont.Almarai.Bold.value, size: 16)
        btn2.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        btn2.addTarget(self, action: #selector(editProfileAction), for: .touchUpInside)
        return UIBarButtonItem(customView: btn2)
    }
    private func setAddServiseNavBtn()-> UIBarButtonItem{
        let btn2 = UIButton(type: .custom)
        btn2.setTitle("+ Add New Servise".localized, for: .normal)
        btn2.tintColor = AppColor.gren
        btn2.setTitleColor(AppColor.gren, for: .normal)
        btn2.titleLabel?.font = UIFont(name: AppFont.Almarai.Bold.value, size: 16)
        btn2.frame = CGRect(x: 0, y: 0, width: 20, height: 30)
       /* btn2.borderwidth = 1
        btn2.cornerRadius = 5
        btn2.borderColor = AppColor.orange*/
        btn2.addTarget(self, action: #selector(addNewServiseAction), for: .touchUpInside)
        return UIBarButtonItem(customView: btn2)
    }
    private func setNotificationNavBtn()-> UIBarButtonItem{
        let btn2 = UIButton(type: .custom)
        btn2.setImage(UIImage(named: "notification"), for: .normal)
        btn2.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        btn2.addTarget(self, action: #selector(NotificationAction), for: .touchUpInside)
        return UIBarButtonItem(customView: btn2)
    }
    private func setFilterNavBtn()-> UIBarButtonItem{
        let btn2 = UIButton(type: .custom)
        btn2.setImage(UIImage(named: "filter-3"), for: .normal)
        btn2.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        btn2.addTarget(self, action: #selector(filterAction), for: .touchUpInside)
        return UIBarButtonItem(customView: btn2)
    }
    @objc private func addNewServiseAction(){
       
    }
    @objc private func editProfileAction(){
      
    }
    
    @objc private func filterAction(){
      
    }
    @objc private func NotificationAction(){
        
    }
    
    
 /*   func setShadow(view : UIView , width : Int , height: Int , shadowRadius: CGFloat , shadowOpacity: Float , shadowColor: CGColor){
         // to make the shadow with rounded corners and offset shadow form the bottom
         view.layer.shadowColor = shadowColor
         view.layer.shadowOffset = CGSize(width: width, height: height)
         view.layer.shadowRadius = shadowRadius
         view.layer.shadowOpacity = shadowOpacity
         view.clipsToBounds = true
         view.layer.masksToBounds = false
       }*/
    
    func datePicker(txt : UITextField) {
        let myDatePicker: UIDatePicker = UIDatePicker()
        myDatePicker.datePickerMode = .date
        myDatePicker.timeZone = .current
        myDatePicker.frame = CGRect(x: 0, y: 15, width: 270, height: 200)
        let alertController = UIAlertController(title: "\n\n\n\n\n\n\n\n", message: nil, preferredStyle: .alert)
        alertController.view.addSubview(myDatePicker)
        let selectAction = UIAlertAction(title: AppString.AlertOK, style: .default, handler: { _ in
            txt.text = myDatePicker.date.getFormattedDate()
        })

        let cancelAction = UIAlertAction(title: AppString.AlertCancel, style: .cancel, handler: nil)
        alertController.addAction(selectAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    

    

    
    func calcuateCategoryCellSize(cat : String) -> CGSize{
         let stringAttribut = NSAttributedString.init(string: cat,
                                                      attributes: [NSAttributedString.Key.font : UIFont(name: AppFont.Cairo.regular.value, size: 13)!])
         let size = stringAttribut.boundingRect(with: CGSize.init(width: Double(MAXFLOAT), height: 38.0),
                                                options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                                context: nil )
         let actualWidth = size.width + 25
         return CGSize.init(width: actualWidth , height: 30)
     }
    //==========================
    func GOTODeviceMap(lat : String , long : String , mapItemName :String){
        let lat : NSString = lat as NSString
        let long : NSString = long as NSString
        let coordinates = CLLocationCoordinate2DMake(lat.doubleValue,long.doubleValue)
        let regionSpan =   MKCoordinateRegion(center: coordinates, latitudinalMeters: 1000, longitudinalMeters: 1000)
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = mapItemName
        mapItem.openInMaps(launchOptions:[
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center)
            ] as [String : Any])
    }
    
    //=====Alerts=======
    func getAddressFromLatLon(pdblLatitude: String, withLongitude pdblLongitude: String,txt : UILabel) {
        var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
        let lat: Double = Double("\(pdblLatitude)")!
        let lon: Double = Double("\(pdblLongitude)")!
        var addressString : String = ""
        let ceo: CLGeocoder = CLGeocoder()
        center.latitude = lat
        center.longitude = lon
        
        let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)
        
        
        ceo.reverseGeocodeLocation(loc, completionHandler:
            {(placemarks, error) in
                if (error != nil)
                {
                    print("reverse geodcode fail: \(error!.localizedDescription)")
                }
                let pm = placemarks! as [CLPlacemark]
                
                if pm.count > 0 {
                    let pm = placemarks![0]
                    if pm.subLocality != nil {
                        addressString = addressString + pm.subLocality! + ", "
                    }
                    if pm.locality != nil {
                        addressString = addressString + pm.locality! + ", "
                    }
                    if pm.subThoroughfare != nil {
                        addressString = addressString + pm.subThoroughfare! + ", "
                    }
                    if pm.country != nil {
                        addressString = addressString + pm.country! + ", "
                    }
                    if pm.postalCode != nil {
                        addressString = addressString + pm.postalCode! + " "
                    }
                    
                    txt.text = addressString
                    print(addressString)
                }
        })
        
    }
    func getAddressFromLatLon(pdblLatitude: String, withLongitude pdblLongitude: String,txt : UITextField) {
        var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
        let lat: Double = Double("\(pdblLatitude)")!
        let lon: Double = Double("\(pdblLongitude)")!
        var addressString : String = ""
        let ceo: CLGeocoder = CLGeocoder()
        center.latitude = lat
        center.longitude = lon
        
        let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)
        
        
        ceo.reverseGeocodeLocation(loc, completionHandler:
            {(placemarks, error) in
                if (error != nil)
                {
                    print("reverse geodcode fail: \(error!.localizedDescription)")
                }
                let pm = placemarks! as [CLPlacemark]
                
                if pm.count > 0 {
                    let pm = placemarks![0]
                    if pm.subLocality != nil {
                        addressString = addressString + pm.subLocality! + ", "
                    }
                    if pm.locality != nil {
                        addressString = addressString + pm.locality! + ", "
                    }
                    if pm.subThoroughfare != nil {
                        addressString = addressString + pm.subThoroughfare! + ", "
                    }
                    if pm.country != nil {
                        addressString = addressString + pm.country! + ", "
                    }
                    if pm.postalCode != nil {
                        addressString = addressString + pm.postalCode! + " "
                    }
                    
                    txt.text = addressString
                    print(addressString)
                }
        })
        
    }
    
    //-----------
    
    
    //======================
    func json(from object:Any) -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
            return nil
        }
        return String(data: data, encoding: String.Encoding.utf8)
    }
    
    //===================
    func layerShadowBoth(RightShadow : UIView , leftShadow : UIView, YWidth : Int? = nil, YHeight : Int? = nil){
        if YWidth != nil {
            RightShadow.layerShadowRight(_width: YWidth!, _height: YHeight!)
            leftShadow.layerShadowLeft(_width : -(YWidth! - 2) , _Height : -(YHeight! - 2))
        }else{
            RightShadow.layerShadowRight()
            leftShadow.layerShadowLeft()
        }
    }
    
    func MakeNavigationBarInvisible(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    func calculateHeightForstring(txt : String) -> CGRect{
        let size = CGSize(width: 200, height: 1000)
        let options  = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        return NSString(string: txt).boundingRect(with: size, options: options, attributes:[NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)], context: nil)
    }
    // The animation
    func ChainAnimation(views : UIView...) {
        var delay = 0.5
        views.forEach { (view) in
            UIView.animate(withDuration: 0.7, delay: delay * 1.5, options: .curveEaseIn, animations: {
                view.alpha = 1
            }, completion: nil)
            delay += 0.2
        }
        
    }
    func ShowDatePickerAlert(txt : UITextField ){
        let myDatePicker: UIDatePicker = UIDatePicker()
        myDatePicker.datePickerMode = .date
        myDatePicker.frame = CGRect(x: 0, y: 15, width: 290, height: 200)
        
        let alertController = UIAlertController(title: "\n\n\n\n\n\n\n\n", message: nil, preferredStyle: UIAlertController.Style.alert)
        alertController.view.addSubview(myDatePicker)
        let selectAction = UIAlertAction(title: "Ok".localized, style: UIAlertAction.Style.default, handler: { _ in
            txt.text = myDatePicker.date.getFormattedDate()
        })
        let cancelAction = UIAlertAction(title: "Cancel".localized, style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(selectAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion:{})
    }
    
    
    public static var storyboardIdentifier: String {
        return self.description().components(separatedBy: ".").dropFirst().joined(separator: ".")
    }
}

class PaddedLabel: UILabel {
    
    @IBInspectable var topInset: CGFloat = 5.0
    @IBInspectable var bottomInset: CGFloat = 5.0
    @IBInspectable var leftInset: CGFloat = 7.0
    @IBInspectable var rightInset: CGFloat = 7.0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
        //super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
    
    override var intrinsicContentSize: CGSize {
        var intrinsicSuperViewContentSize = super.intrinsicContentSize
        intrinsicSuperViewContentSize.height += topInset + bottomInset
        intrinsicSuperViewContentSize.width += leftInset + rightInset
        return intrinsicSuperViewContentSize
    }
    override func awakeFromNib() {
        self.layer.cornerRadius = 12
        self.textAlignment = .right
    }
}
class ProgressBarView: UIView {
    var bgPath: UIBezierPath!
    var shapeLayer: CAShapeLayer!
    var progressLayer: CAShapeLayer!
}

extension UIViewController {
    
    func showMessage(title: String? = nil, sub: String?, type: Theme = .warning, layout: MessageView.Layout = .messageView) {
        // Instantiate a message view from the provided card view layout. SwiftMessages searches for nib
        // files in the main bundle first, so you can easily copy them into your project and make changes.
        let view = MessageView.viewFromNib(layout: layout)
        
        // Theme message elements with the warning style.
        view.configureTheme(type)
        view.button?.isHidden = true
        // Add a drop shadow.
        //        view.configureDropShadow()
        
        // Set message title, body, and icon. Here, we're overriding the default warning
        // image with an emoji character.
        
        view.configureContent(title: title ?? "", body: sub ?? "", iconText: "")
        
        // Show the message.
        SwiftMessages.show(view: view)
    }
}
extension UIViewController {
    open override func awakeFromNib() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "d", style: .plain, target: nil, action: nil)
    }
}
