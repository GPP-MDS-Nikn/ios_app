//
//  Event.swift
//  Nikin_App
//
//  Created by Lucas Freitas de Oliveira on 11/17/15.
//  Copyright © 2015 Lucas Freitas de Oliveira. All rights reserved.
//

import UIKit

class Event: NSObject {
    
    var id: Int!
    var title:String!
    var local:String!
    var descriptionEvent:String!
    var startTime: String!
    var endTime: String!

    
    init(dictionary: NSDictionary) {
        super.init()
        id = dictionary["id"] as! Int
        title = dictionary["title"] as! String
        descriptionEvent = dictionary["description"] as! String
        local = dictionary["local"] as! String
        endTime = dictionary["end_time"] as! String
        startTime = dateFromString(dictionary["start_time"] as! String)

    }
    
    
    func dateFromString(date: String) -> String {
        
        let dateFormatter: NSDateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let dateDate = dateFormatter.dateFromString(date)!
        
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.stringFromDate(dateDate)
    }

    
}
