//
//  NewsViewController.swift
//  Nikin_App
//
//  Created by Lucas Freitas de Oliveira on 11/17/15.
//  Copyright © 2015 Lucas Freitas de Oliveira. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: NewsController!
    var selectedNews: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        dataSource = NewsController()
        tableView.dataSource = dataSource
        dataSource.tableView = self.tableView
    }
    
  
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedNews = indexPath.row
        self.performSegueWithIdentifier("callNewsDetail", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! NewsDetailTableView
        let news = dataSource.connect.returnNewsAtIndex(selectedNews)
        
        controller.news = news	
    }

}
