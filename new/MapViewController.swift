//
//  MapViewController.swift
//  new
//
//  Created by Юлия Чужинова on 13.10.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
        
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
       checkLocationEnable()
    }
    func checkLocationEnable(){
        if CLLocationManager.locationServicesEnabled(){
        setupManager()
        checkAutorization()
        } else {
            showAlertController(title: "Your geolocation is off", message: "Want to turn on?", url: URL(string: "App-Prefs:root=LOCATION_SERVICES"))
        }
    }
    func setupManager(){
           locationManager.delegate = self
           locationManager.desiredAccuracy = kCLLocationAccuracyBest
       }
    
    func checkAutorization(){
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            locationManager.startUpdatingLocation()
            break
        case .denied:
            showAlertController(title: "Suggestion to use location", message: "Want to change it?", url: URL(string: UIApplication.openSettingsURLString))
            break
        case .notDetermined:
            break
        case .restricted:
            locationManager.requestWhenInUseAuthorization()
        }
    }
    func showAlertController(title: String, message: String?, url: URL?){
       let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let settingAction = UIAlertAction(title: "Setting", style: .default) { (alert) in
            if let url = url{
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        let canselAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(settingAction)
        alert.addAction(canselAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
extension MapViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last?.coordinate{
            let region = MKCoordinateRegion(center: location, latitudinalMeters: 500, longitudinalMeters: 500)
            mapView.setRegion(region, animated: true)
       
        }
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkAutorization()
    }
}
