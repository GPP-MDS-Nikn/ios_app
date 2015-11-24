//
//  Artwork.swift
//  Nikin_App
//
//  Created by Lucas Freitas de Oliveira on 11/23/15.
//  Copyright © 2015 Lucas Freitas de Oliveira. All rights reserved.
//

import UIKit
import MapKit

class Artwork: NSObject, MKAnnotation {

    let title: String?
    let locationName: String
    //let discipline: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        //self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
    
}
