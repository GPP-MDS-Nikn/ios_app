//
//  CareUnitMapVC.swift
//  Nikin_App
//
//  Created by Lucas Freitas de Oliveira on 11/13/15.
//  Copyright © 2015 Lucas Freitas de Oliveira. All rights reserved.
//

import UIKit
import MapKit

class CareUnitMapVC: UIViewController, AsyncUpdate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    var connect: CareUnitConnection!
    let regionRadius: CLLocationDistance = 1000
    var careUnit: CareUnit!
    
    func loadData() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        connect = CareUnitConnection()
        connect.asyncObject = self
        connect.getcareUnits()
        
        
        mapView.delegate = self
        let initialLocation = CLLocation(latitude: -16.019736, longitude: -48.063628)
        centerMapOnLocation(initialLocation)
        // Do any additional setup after loading the view.
        
        let artwork = Artwork(title: "King David Kalakaua",
            locationName: "Waikiki Gateway Park",
            coordinate: CLLocationCoordinate2D(latitude: -16.019736, longitude: -48.063628))
        
        mapView.addAnnotation(artwork)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    func initCareUnits() {
        for var index = 0; index <= connect.countTotalCareUnits(); ++index {
            var newCareUnit = connect.returncareUnitsAtIndex(index)
        }
    }
}
