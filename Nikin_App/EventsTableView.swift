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
    @IBOutlet weak var coverImage: UIImageView!
    
    var event = Event!()
 
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = event.title
        descriptionTextView.text = event.descriptionEvent
        dateLabel.text = event.date
        timeLabel.text = event.startTime
        coverImage.image = event.coverImage
        
        
    }
    
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
