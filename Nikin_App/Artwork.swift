//
//  Artwork.swift
//  Nikin_App
//
//  Created by Lucas Freitas de Oliveira on 11/23/15.
//  Copyright © 2015 Lucas Freitas de Oliveira. All rights reserved.
//

import UIKit
import MapKit
import Contacts

class Artwork: NSObject, MKAnnotation {

    let title: String?
    let locationName: String
    let coordinate: CLLocationCoordinate2D
    var tag: Int!
    
    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
        
    }
    
    func mapItem() -> MKMapItem {
        let addressDictionary = [String(CNPostalAddressStreetKey): self.subtitle!]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDictionary)
        
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        
        return mapItem
    }
    
    var subtitle: String? {
        return locationName
    }
    
    func fromNSArray(careUnit: CareUnit) -> Artwork? {
          
        var title: String
        if let titleOrNil = careUnit.name {
            title = titleOrNil
        } else {
            title = ""
        }
        
        let locationName = careUnit.institution
        let coordinate = careUnit.coordinate
      
        
        return Artwork(title: title, locationName: locationName!, coordinate: coordinate!)
    }
    
    func initArtwork (title: String, locationName: String, coordinate: CLLocationCoordinate2D) -> Artwork? {
        
        return Artwork(title: title, locationName: locationName, coordinate: coordinate)
    }

    
}
