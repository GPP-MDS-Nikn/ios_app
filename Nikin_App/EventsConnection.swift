//
//  EventsConnection.swift
//  Nikin_App
//
//  Created by Lucas Freitas de Oliveira on 11/17/15.
//  Copyright © 2015 Lucas Freitas de Oliveira. All rights reserved.
//

import UIKit
import Alamofire

class EventsConnection: NSObject {

    var eventsJSON: NSArray?
    var asyncObject: AsyncUpdate!
    
    func countTotalEvents() -> Int {
        if eventsJSON != nil {
            return eventsJSON!.count
        }
        return 0
    }
    
    func getEvents () {
        Alamofire.request(.GET, Constants.GET_EVENTS)  .responseJSON { response in
            //print("Response REQUEST: ", response.request)  // original URL request
            //print("Response RESPONSE: ", response.response) // URL response
            //print("Response DATA: ", response.data)     // server data
            //print("Response RESULT: ", response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                self.eventsJSON = JSON as? NSArray
                self.asyncObject.loadData()
            }
        }
    }
    
    func returnEventAtIndex (index:NSInteger) -> Event? {
        
        var event: Event?
        
        if eventsJSON != nil {
            let reverseArray = eventsJSON?.reverseObjectEnumerator().allObjects
            event = Event(dictionary: reverseArray![index] as! NSDictionary)
            return event
        }
        
        return event
        
    }
    
    func turnInDictionary(event: Event) -> NSDictionary {
        let dictionary = NSMutableDictionary()
        dictionary.setValue(event.id, forKey: "id")
        print(dictionary)
        
        return dictionary
    }
}
