//
//  NewsDetailTableView.swift
//  Nikin_App
//
//  Created by Lucas Freitas de Oliveira on 11/21/15.
//  Copyright © 2015 Lucas Freitas de Oliveira. All rights reserved.
//

import UIKit

class NewsDetailTableView: UITableViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    var news = NewsPost!()
    //var dateDate = NSDate!()
    //var dateFormatter = NSDateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //date = converStringToNSDate(news.date)
        
        titleLabel.text = news.title
        authorLabel.text = news.author
        descriptionTextView.text = news.body
        dateFromString(news.date)
        dateLabel.text = dateFromString(news.date)

    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    func dateFromString(date: String) -> String {
        
        let dateFormatter: NSDateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let dateDate = dateFormatter.dateFromString(date)!
        
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.stringFromDate(dateDate)
    }

    func convertNSDateToString(date: NSDate) -> String {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        return dateFormatter.stringFromDate(date)
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
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
