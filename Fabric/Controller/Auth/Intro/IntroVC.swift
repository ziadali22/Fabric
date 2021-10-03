//
//  IntroVC.swift
//  Fabric
//
//  Created by ziad on 29/08/2021.
//

import UIKit

class IntroVC: UIViewController {

    @IBOutlet weak var MainView: UIView!
    @IBOutlet weak var DotView: UIView!
    @IBOutlet weak var detailsTxt: UITextView!
    @IBOutlet weak var nextTitle: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var MainTitle: UILabel!
    
    fileprivate let isOnBoarding = false
    override func viewDidLoad() {
        super.viewDidLoad()
        nextTitle.setTitle("Next".localized, for: .normal)
        DotView.addDashBorder(color: .white, cornerRadius: 3)
        detailsTxt.isEditable = false
        self.detailsTxt.text = UserDataActions.getSettingModel()?.screenOne
    }
    @IBAction func next(_ sender: Any) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            self.imageView.transform = CGAffineTransform(translationX: -30, y: 0)
        } completion: { (_ ) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut) {
                self.imageView.alpha = 0
                self.imageView.transform = CGAffineTransform(translationX:0, y: -200)
            }
        }
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            self.MainTitle.transform = CGAffineTransform(translationX: -30, y: 0)
        } completion: { (_ ) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut) {
                self.MainTitle.alpha = 0
                self.MainTitle.transform = CGAffineTransform(translationX:0, y: -200)
            }
        }
        UIView.animate(withDuration: 0.5, delay: 0.6, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            self.detailsTxt.transform = CGAffineTransform(translationX: -30, y: 0)
        } completion: { (_ ) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut) {
                self.detailsTxt.alpha = 0
                self.detailsTxt.transform = CGAffineTransform(translationX:0, y: -200)
            } completion: { (_ ) in
            
                let vc = self.storyboard?.instantiateViewController(identifier: "Cell") as! introSecondVC
                vc.modalPresentationStyle = .fullScreen
                vc.modalTransitionStyle  = .crossDissolve
                self.present(vc, animated: true, completion: nil)
            }
        }
        
    }
    
}

