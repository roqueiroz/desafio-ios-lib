//
//  DeviceInfo.swift
//  desafio-ios-lib
//
//  Created by Rodrigo Gonçalves de Queiroz on 22/10/22.
//

import UIKit
import CoreLocation

internal class DeviceInfo {
    
    lazy var locationManager = CLLocationManager()
    
    func systemUptime() -> String {
        
        var bootTime: String = ""
        
        let time = NSInteger(ProcessInfo.processInfo.systemUptime)
        
        let hours = (time / 3600)
        let minutes = (time / 60) % 60
        let seconds = (time % 60)
        
        bootTime = NSString(format: "%0.2d:%0.2d:%0.2d", hours, minutes, seconds) as String
        
        return bootTime
    }
    
    func getInfoPlatform() -> String {
        
        let device = UIDevice.current
        
        let platform = device.type.rawValue
        
        return platform
    }
    
    func getLocation() -> (String, String) {
        
        guard let location = locationManager.location else { return ("", "") }
        
        let latitude = String(location.coordinate.latitude)
        let longitude = String(location.coordinate.longitude)
        
        return (latitude, longitude)
    }
    
    func requestUserLocationAuthorization() {
        
        switch CLLocationManager.authorizationStatus() {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            
        case .restricted:
            break
            
        case .denied:
            break
            
        case .authorizedAlways, .authorizedWhenInUse:
            break
            
        @unknown default:
            break
        }
        
    }
    
}
