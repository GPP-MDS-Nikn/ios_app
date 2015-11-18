//
//  EventsController.swift
//  Nikin_App
//
//  Created by Lucas Freitas de Oliveira on 11/17/15.
//  Copyright © 2015 Lucas Freitas de Oliveira. All rights reserved.
//

import UIKit

class EventsController: NSObject, UITableViewDataSource, AsyncUpdate {
    
    var connect: EventsConnection!
    var tableView: UITableView?
    
    func loadData() {
        
        tableView?.reloadData()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return connect.countTotalEvents()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! CustomEventsCell
        
        let event = connect.returnEventAtIndex(indexPath.row)
        
        if event != nil {
            cell.eventTitle.text = event?.title
            
        }
        
        return cell
    }
    

    override init() {
        super.init()
        
        connect = EventsConnection()
        connect.asyncObject = self
        connect.getEvents()
    }
}
