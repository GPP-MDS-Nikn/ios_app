//
//  Treatment.swift
//  Nikin_App
//
//  Created by Lucas Freitas de Oliveira on 11/25/15.
//  Copyright © 2015 Lucas Freitas de Oliveira. All rights reserved.
//

import UIKit

class Treatment: NSObject {
    
    static func idIntoString(id: Int) -> String {
        
        var string: String!
        
        if id < 10 {
            string = "00" + String(id)
        } else if id < 100 {
            string = "0" + String(id)
        } else {
            string = String(id)
        }
        
        return string
    }
    
    static func getImageFromURL (urlImage: String, id: Int) -> UIImage {
        
        let idString = idIntoString(id)
        
        if let url = NSURL(string: Constants.GET_EVENTS_IMAGES+idString+"/original/"+urlImage) {
            if let data = NSData(contentsOfURL: url) {
                return UIImage(data: data)!
            }
        }
        return UIImage(named: "nikn_default_banner.png")!
    }
    
    static func timeFromString(date: String) -> String {
        
        let dateFormatter: NSDateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let dateTime = dateFormatter.dateFromString(date)!
        
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.stringFromDate(dateTime)
    }
    
    static func dateFromString(date: String) -> String {
        
        let dateFormatter: NSDateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let dateDate = dateFormatter.dateFromString(date)!
        
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.stringFromDate(dateDate)
    }

}
