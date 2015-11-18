//
//  EventsViewController.swift
//  Nikin_App
//
//  Created by Lucas Freitas de Oliveira on 11/17/15.
//  Copyright © 2015 Lucas Freitas de Oliveira. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: EventsController!
    var selectedEvent: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = EventsController()
        tableView.dataSource = dataSource
        dataSource.tableView = self.tableView
        
        self.tableView.delegate = self
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedEvent = indexPath.row
        self.performSegueWithIdentifier("callEventDetail", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
        let controller = segue.destinationViewController as! EventsDetail
        let event = dataSource.connect.returnEventAtIndex(selectedEvent)
        
        controller.event = event
        
    }
    
}
