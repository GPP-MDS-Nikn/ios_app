//
//  NewsController.swift
//  Nikin_App
//
//  Created by Lucas Freitas de Oliveira on 11/17/15.
//  Copyright © 2015 Lucas Freitas de Oliveira. All rights reserved.
//

import UIKit

class NewsController: NSObject, UITableViewDataSource, AsyncUpdate {
    
    var connect: NewsPostConnection!
    var tableView: UITableView?
    
    func loadData() {
        tableView?.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return connect.countTotalNews()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("newsReuseIdentifier", forIndexPath:  indexPath) as! NewsCustomCelll
        
        let newsPost = connect.returnNewsAtIndex(indexPath.row)
        
        if newsPost != nil {
            cell.titleLabel.text = newsPost?.title
            //cell.authorLabel.text = newsPost?.author
        }
    
        return cell
    }
    
    override init() {
        super.init()
        
        connect = NewsPostConnection()
        connect.asyncObject = self
        connect.getNews()

    }

  
    
}
