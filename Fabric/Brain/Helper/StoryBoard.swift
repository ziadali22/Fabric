//
//  StoryBoard.swift
//  sabeelUser
//
//  Created by Abulrahman mohsen on 3/21/20.
//  Copyright © 2020 Abulrahman mohsen. All rights reserved.
//

import UIKit

public enum Storyboard: String {
    case Auth
    //case Home
    public func instantiate<VC: UIViewController>(_ viewController: VC.Type) -> VC {
        
        guard
            let vc = UIStoryboard(name: self.rawValue, bundle: nil)
                .instantiateViewController(withIdentifier: VC.storyboardIdentifier) as? VC
            else { fatalError("Couldn't instantiate \(VC.storyboardIdentifier) from \(self.rawValue)") }
        return vc
    }
    
}
