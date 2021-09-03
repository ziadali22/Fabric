//
//  splashVC.swift
//  Fabric
//
//  Created by ziad on 02/09/2021.
//

import UIKit

class splashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Request()
        
    }
    func Request(){
        AuthRequestRouter.intro.send(BaseModel<Setting>.self, then: handleResponse)
    }
    
    var handleResponse: HandleResponse<BaseModel<Setting>> {
        return { [weak self] (response) in
            guard let self = self else {return}
            
            switch response {
            case .failure(let error):
                self.showMessage(sub: error.localizedDescription)
            case .success(let model):
                if model.status{
                    guard let item = model.data else {return}
                    UserDataActions.cashSettingModel(setting: item)
                    if UserDataActions.getUserModel() != nil{
                        //tabbar
                        let vc = self.storyboard?.instantiateViewController(identifier: "tapBar")
                        vc?.modalPresentationStyle = .fullScreen
                        guard let controller = vc else { return  }
                        self.present(controller, animated: true, completion: nil)
                    }else{
                        //intro\
                        ///UserDataActions.removeUserModel()
                        let vc = self.storyboard?.instantiateViewController(identifier: "intro") as! IntroVC
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated: true, completion: nil)
                        
                    }
                 //   
                }else{
                    guard let errorMsg = model.msg else{return}
                    self.showMessage(sub: errorMsg)
                }
                
            }
        }
    }



}

