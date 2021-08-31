//
//  ActivityView.swift
//  sabeelUser
//
//  Created by Abulrahman mohsen on 3/21/20.
//  Copyright © 2020 Abulrahman mohsen. All rights reserved.
//

import UIKit

public class ActivityView: UIView {
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let ref = UIActivityIndicatorView()
        ref.color = AppColor.gren
        ref.translatesAutoresizingMaskIntoConstraints = false
        ref.hidesWhenStopped = true
        return ref
    }()
    
    init(){
        super.init(frame: .zero)
        setupIndicator()
    }
    
    fileprivate func setupIndicator() {
        addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupIndicator()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupIndicator()
    }
    
    
    func startAnimating(){
        activityIndicator.startAnimating()
    }
    
    
    func stopAnimating(){
        activityIndicator.stopAnimating()
    }
    
}
extension UIView{
 
    func showLoader(_ backgroundColor:UIColor? = nil ,_ activityColor : UIColor? = .white){
        
        let LoaderView  = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        LoaderView.tag = -1
        LoaderView.backgroundColor = backgroundColor
        let Loader = UIActivityIndicatorView(/*frame: CGRect(x: 0, y: 0, width: 60, height: 30)*/)
        Loader.center = LoaderView.center
       // Loader.style = .whiteLarge
        Loader.color = activityColor
        Loader.startAnimating()
        LoaderView.addSubview(Loader)
        self.addSubview(LoaderView)
    }

    func dismissLoader(){
        
        self.viewWithTag(-1)?.removeFromSuperview()
    }
}
