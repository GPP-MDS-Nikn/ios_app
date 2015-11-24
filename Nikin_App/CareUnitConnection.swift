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

    var careUnitsJSON: NSArray?
    var asyncObject: AsyncUpdate!
    
    func countTotalCareUnits() -> Int {
        if careUnitsJSON != nil {
            return careUnitsJSON!.count
        }
        return 0
    }
    
    func getcareUnits () {
        
        Alamofire.request(.GET, Constants.GET_CARE_UNITS).responseJSON { response in
            
            if let JSON = response.result.value {
                self.careUnitsJSON = JSON as? NSArray
                self.asyncObject.loadData()
            }
        }
        
    }
    
    func returncareUnitsAtIndex (index: NSInteger)-> CareUnit? {
        
        var careUnit: CareUnit?
        
        if careUnitsJSON != nil {
            careUnit = CareUnit(careUnitDictionary: careUnitsJSON![index] as! NSDictionary)
            return careUnit
        }
        
        return careUnit
    }
    
    func turnInDictionary(careUnit: CareUnit) -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        dictionary.setValue(careUnit.id, forKey: "id")
        print(dictionary)
        
        return dictionary
    }
}
