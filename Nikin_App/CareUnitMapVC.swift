//
//  CareUnitMapVC.swift
//  Nikin_App
//
//  Created by Lucas Freitas de Oliveira on 11/13/15.
//  Copyright © 2015 Lucas Freitas de Oliveira. All rights reserved.
//

import UIKit
import MapKit

class CareUnitMapVC: UIViewController, AsyncUpdate, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var userLocationButton: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    
    var connect: CareUnitConnection!
    let regionRadius: CLLocationDistance = 1000
    var careUnit: CareUnit!
    var artworks: [Artwork]?
    var userLocationVar: CLLocation!
    
    lazy var locationManager: CLLocationManager = {
        var manager = CLLocationManager()
        manager.delegate = self
        return manager
    }()
    
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            mapView.showsUserLocation = true
            locationManager.startUpdatingLocation()
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func loadData() {

        for var i = 0; i < connect.countTotalCareUnits(); ++i{
            let careUnit = connect.returncareUnitsAtIndex(i)
            let artwork = Artwork(title: (careUnit?.name)!, locationName: (careUnit?.institution)!, coordinate: (careUnit?.coordinate)!)
            
            artwork.tag = i
            mapView.addAnnotation(artwork)
        }
    
        
//        for i in 0...connect.countTotalCareUnits()-1 {
//            
//        }
        
        
    }
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        mapView.userLocation
        
        let region = MKCoordinateRegionMakeWithDistance((userLocation.location?.coordinate)!, 5000, 5000)
        
        userLocationVar = mapView.userLocation.location
        
        mapView.setRegion(region, animated: true)
        //mapView.centerCoordinate = userLocation.location!.coordinate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        connect = CareUnitConnection()
        connect.asyncObject = self
        connect.getcareUnits()

        checkLocationAuthorizationStatus()
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        userLocationButton.layer.cornerRadius = 5
        userLocationButton.layer.borderWidth = 1
        userLocationButton.layer.borderColor = UIColor.blackColor().CGColor
        
    }
    
    @IBAction func goToUserLocation(sender: AnyObject) {
        zoomIn()
    }
    func zoomIn () {
        let userLocation = mapView.userLocation
        
        let region = MKCoordinateRegionMakeWithDistance(
            (userLocation.location?.coordinate)!, 5000, 5000)
        
        userLocationVar = mapView.userLocation.location
        
        mapView.setRegion(region, animated: true)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        loadData()
        
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 150.0, regionRadius * 150.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }

}
