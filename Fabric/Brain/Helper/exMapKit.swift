//
//  exMapKit.swift
//  sabeelUser
//
//  Created by Abulrahman mohsen on 3/21/20.
//  Copyright © 2020 Abulrahman mohsen. All rights reserved.
//

import UIKit
import MapKit
extension MKMapView {
    func setRegionMap(lat : String , long : String ){
        let latt: Double = Double("\(lat)")!
        let longg: Double = Double("\(long)")!
        
        let locValue: CLLocationCoordinate2D = CLLocationCoordinate2D.init(latitude: latt, longitude: longg)
        
        let region = MKCoordinateRegion(center: locValue, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: latt , longitude: longg)
        self.addAnnotation(annotation)
        self.setRegion(region, animated: true)
    }
}
