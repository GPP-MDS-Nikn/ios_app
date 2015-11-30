//
//  CareUnit.swift
//  Nikin_App
//
//  Created by Lucas Freitas de Oliveira on 11/13/15.
//  Copyright © 2015 Lucas Freitas de Oliveira. All rights reserved.
//

import MapKit
import UIKit

class CareUnit: NSObject {
    
    var id: Int!
    var district: String!
    var category: String!
    var institution: String!
    var descriptionCareUnit: String!
    var name: String!
    var address: String!
    var zipCode: String!
    var city: String!
    var phone: String!
    var email: String!
    var site: String!
    var coordinate: CLLocationCoordinate2D!
    
    var latitude: String!
    var longitude: String!

    init(careUnitDictionary: NSDictionary) {
        id = careUnitDictionary["id"] as! Int
        district = careUnitDictionary["district"] as! String
        institution = careUnitDictionary["institution"] as! String
        descriptionCareUnit = careUnitDictionary["description"] as! String
        name = careUnitDictionary["name"] as! String
        address = careUnitDictionary["address"] as! String
        zipCode = careUnitDictionary["zip_code"] as! String
        city = careUnitDictionary["city"] as! String
        phone = careUnitDictionary["phone"] as! String
        email = careUnitDictionary["email"] as! String
        site = careUnitDictionary["site"] as! String
        latitude = careUnitDictionary["latitude"] as! String
        longitude = careUnitDictionary["longitude"] as! String
        coordinate = CLLocationCoordinate2D(latitude: (latitude as NSString).doubleValue, longitude: (longitude as NSString).doubleValue)
        
        
    }
    
    override init() {
        super.init()
    }
}
