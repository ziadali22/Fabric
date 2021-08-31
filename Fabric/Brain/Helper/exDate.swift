//
//  exDate.swift
//  sabeelUser
//
//  Created by Abulrahman mohsen on 3/21/20.
//  Copyright © 2020 Abulrahman mohsen. All rights reserved.
//

import UIKit

/*extension Date{
    func getFormattedDate() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss +zzzz"
        
        let formateDate = dateFormatter.date(from:"\(self)")!
       // dateFormatter.dateFormat = "dd-MM-yyyy"
         dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: formateDate)
    }
    func getFormattedTime() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss +zzzz"
        
        let formateDate = dateFormatter.date(from:"\(self)")!
        dateFormatter.dateFormat = "HH:mm"
        //dateFormatter.timeStyle = .short
        return dateFormatter.string(from: formateDate)
    }
    func getFormatedDateAndTime() -> String{
        let formatDate  = getFormattedDate()
        let formateTime = getFormattedTime()
        let result = "\(formatDate) \(formateTime)"
        print(result)
        return result
    }
}*/
extension Date{
    func getFormattedDate() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "en_US")
        let formateDate = dateFormatter.string(from: self)
        

        // dateFormatter.dateFormat = "dd-MM-yyyy"
        //         dateFormatter.dateFormat = "yyyy-MM-dd"
        print(formateDate)
        return formateDate
    }
    func getFormattedTime() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.locale = Locale(identifier: "en_US")

        //        dateFormatter.dateFormat = "yyyy-MM-dd’T’HH:mm:ssZZZZZ"
        let formateDate = dateFormatter.string(from: self)

        //dateFormatter.timeStyle = .short
        //        return dateFormatter.string(from: formateDate)
        print(formateDate)

        return formateDate
    }
    func getFormatedDateAndTime() -> String{
        let formatDate  = getFormattedDate()
        let formateTime = getFormattedTime()
        let result = "\(formatDate) \(formateTime)"
        print(result)
        return result
    }
}
