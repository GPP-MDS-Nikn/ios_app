//
//  NewsPost.swift
//  Nikin_App
//
//  Created by Lucas Freitas de Oliveira on 11/13/15.
//  Copyright © 2015 Lucas Freitas de Oliveira. All rights reserved.
//

import UIKit

class NewsPost: NSObject {

    var id: Int!
    var title:String!
    var author:String!
    var body:String!
    var date:String!
    

    init(newsDictionary: NSDictionary) {
        id = newsDictionary["id"] as! Int
        title = newsDictionary["title"] as! String
        author = newsDictionary["author"] as! String
        body = newsDictionary["body"] as! String
        date = newsDictionary["created_at"] as! String
    }
}

