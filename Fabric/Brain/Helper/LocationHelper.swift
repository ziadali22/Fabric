//
//  LocationHelper.swift
//  sabeelUser
//
//  Created by Abulrahman mohsen on 3/21/20.
//  Copyright © 2020 Abulrahman mohsen. All rights reserved.
//

import Foundation
import CoreLocation

class LocationHelper: NSObject, CLLocationManagerDelegate {
    
    private lazy var locationManager: CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        return locationManager
    }()
    
    var locationUpdated: ((_ lat: Double, _ long: Double) -> ())?
    
    func requestLocationAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func getCurrentUserLocation() {
        locationManager.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        locationUpdated?(location.coordinate.latitude, location.coordinate.longitude)
        stopUpdatingLocation()

    }

}
