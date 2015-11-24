//
//  EventsTableView.swift
//  Nikin_App
//
//  Created by Lucas Freitas de Oliveira on 11/21/15.
//  Copyright © 2015 Lucas Freitas de Oliveira. All rights reserved.
//

import UIKit

class EventsTableView: UITableViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var event = Event!()
 
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = event.title
        descriptionTextView.text = event.descriptionEvent
        dateLabel.text = event.startTime
        
    }
    
//    func dateFromString(date: String) -> String {
//        
//        let dateFormatter: NSDateFormatter = NSDateFormatter()
//        
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
//        let dateDate = dateFormatter.dateFromString(date)!
//        
//        dateFormatter.dateFormat = "dd/MM/yyyy"
//        return dateFormatter.stringFromDate(dateDate)
//    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return 1
        case 1:
            return 2
        default:
            return 0
        }
    }

    
}
