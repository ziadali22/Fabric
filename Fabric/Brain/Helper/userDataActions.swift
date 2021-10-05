//
//  userDataActions.swift
//  sabeelUser
//
//  Created by Abulrahman mohsen on 3/21/20.
//  Copyright © 2020 Abulrahman mohsen. All rights reserved.
//

import UIKit
import Alamofire
extension Encodable {
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
    
    func asArray() throws -> [[String: Any]] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: Any]] else {
            throw NSError()
        }
        return dictionary
    }
    
}

let userKey = "userDataCash"
let settingKey = "settingDataCash"
let sliderKet = "sliderDataCash"

struct UserDataActions {

    func getCurrentLanguage(){
        
    }
  

    static func cashUserModel(user: User) ->Void {
        let userDictionary = try! user.asDictionary()
        
        UserDefaults.standard.set(userDictionary, forKey: userKey)
        
    }
    static func cashSettingModel(setting: Setting) -> Void {
        let settingDictionary = try! setting.asDictionary()
        UserDefaults.standard.set(settingDictionary, forKey: settingKey)
    }
    

    
    static func removeUserModel(){
        UserDefaults.standard.removeObject(forKey: userKey)
    }
    
    static func removeSettingModel(){
        UserDefaults.standard.removeObject(forKey: settingKey)
    }
    
    static func getDeviceUDID() -> String{
        return UIDevice.current.identifierForVendor!.uuidString
    }
    
   static func HeaderForRequestWithToken() -> [String : String]?{
        if UserDefaults.standard.object(forKey: userKey) == nil {
            return nil
        }else{
            var Header = [String: String]()
            if let token = UserDataActions.getToken(){
                 Header["Authorization"] = "Bearer \(token)"
            }
           print(Header)
            return Header
        }
    }
    
    static func getToken() -> String? {
        
        guard let userModel = UserDataActions.getUserModel() else {
            return nil
        }
        
        return userModel.token
    }


    
    static func getUserModel() -> User?
    {
        if  let cashedData = UserDefaults.standard.object(forKey: userKey) as? [String : Any]
        {
            let data = try! JSONSerialization.data(withJSONObject: cashedData, options: .prettyPrinted)
            
            let decoder = JSONDecoder()
            do {
                let user = try decoder.decode(User.self, from: data)
                return user
            } catch {
                return nil
            }
            
        }
        
        return nil
    }
    
    static func getSettingModel() -> Setting?
    {
        if  let cashedData = UserDefaults.standard.object(forKey: settingKey) as? [String : Any]
        {
            let data = try! JSONSerialization.data(withJSONObject: cashedData, options: .prettyPrinted)
            
            let decoder = JSONDecoder()
            do {
                let setting = try decoder.decode(Setting.self, from: data)
                return setting
            } catch {
                return nil
            }
            
        }
        
        return nil
    }
    
    
    
    static func sendQuery() -> URLEncoding {
        return URLEncoding(destination: .queryString)
    }
    
    
}

class Language {
    class func currentLanguage() -> String {
        let def = UserDefaults.standard
        let langs = def.object(forKey: "AppleLanguages") as! NSArray
        let firstLang = langs.firstObject as! String
        return firstLang
    }
    
    class func setAppLanguage(lang: String) {
        let def = UserDefaults.standard
        def.removeObject(forKey: "AppleLanguages")
        def.set([lang], forKey: "AppleLanguages")
        def.synchronize()
    }
  
    class func isEnglish()->Bool {
        if currentLanguage() == "en" || currentLanguage() == "en-US"{
            return true
        }else{
            return false
        }
      }
    
}


