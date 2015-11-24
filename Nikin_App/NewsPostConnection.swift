//
//  NewsPostConnection.swift
//  Nikin_App
//
//  Created by Lucas Freitas de Oliveira on 11/13/15.
//  Copyright © 2015 Lucas Freitas de Oliveira. All rights reserved.
//

import UIKit
import Alamofire

class NewsPostConnection: NSObject {
    
    var newsJSON: NSArray?
    var asyncObject: AsyncUpdate!
    
    func countTotalNews() -> Int {
        if newsJSON != nil {
            return newsJSON!.count
        }
        return 0
    }
    
    func getNews () {
    
        Alamofire.request(.GET, Constants.GET_NEWS).responseJSON { response in
            
            if let JSON = response.result.value {
                self.newsJSON = JSON as? NSArray
                self.asyncObject.loadData()
            }
        }
        
    }
    
    func returnNewsAtIndex (index: NSInteger)-> NewsPost? {
        
        var newsPost: NewsPost?
        
        if newsJSON != nil {
            let reverseArray = newsJSON?.reverseObjectEnumerator().allObjects
            newsPost = NewsPost(newsDictionary: reverseArray![index] as! NSDictionary)
            return newsPost
        }
        
        return newsPost
    }
    
    func turnInDictionary(newsPost: NewsPost) -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        dictionary.setValue(newsPost.id, forKey: "id")
        print(dictionary)
        
        return dictionary
    }
    
    
    
}
