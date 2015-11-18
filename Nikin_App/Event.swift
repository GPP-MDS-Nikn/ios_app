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
    var startTime: NSDate?
    var endTime: NSDate?

    
    init(dictionary: NSDictionary) {
        id = dictionary["id"] as! Int
        title = dictionary["title"] as! String
        descriptionEvent = dictionary["description"] as! String
        local = dictionary["local"] as! String

    }
}
