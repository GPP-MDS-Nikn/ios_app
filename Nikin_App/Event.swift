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
    var date:String!
    var startTime: String!
    var endTime: String!
    var coverImageURL: String?
    var coverImage: UIImage?

    init(dictionary: NSDictionary) {
        super.init()
        id = dictionary["id"] as! Int
        title = dictionary["title"] as! String
        descriptionEvent = dictionary["description"] as! String
        local = dictionary["local"] as! String
        date = Treatment.dateFromString(dictionary["start_time"] as! String)
        endTime = Treatment.timeFromString(dictionary["end_time"] as! String)
        startTime = Treatment.timeFromString(dictionary["start_time"] as! String)
        coverImageURL = dictionary["image_file_file_name"] as? String
        if coverImageURL != nil {
            coverImage = Treatment.getImageFromURL(coverImageURL!, id: self.id)
        } else {
            coverImage = UIImage(named: "d7c66fa1338fea52fcee77f8835b1bff.png")
        }
        
    }
    
}
