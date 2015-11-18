//
//  CareUnitConnection.swift
//  Nikin_App
//
//  Created by Lucas Freitas de Oliveira on 11/13/15.
//  Copyright © 2015 Lucas Freitas de Oliveira. All rights reserved.
//

import UIKit
import Alamofire

class CareUnitConnection: NSObject {

    let GET_CARE_UNITS = "http://localhost:8080/api/care_units"
    
    var careUnitsJSON: NSArray?
}
