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
        
        self.tableView.delegate = self
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        dataSource = EventsController()
        tableView.dataSource = dataSource
        dataSource.tableView = self.tableView
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedEvent = indexPath.row
        self.performSegueWithIdentifier("callEventDetail", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
        let controller = segue.destinationViewController as! EventsTableView
        let event = dataSource.connect.returnEventAtIndex(selectedEvent)
        
        controller.event = event
        
    }
    
}
