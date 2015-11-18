//
//  CareUnitDetailsVC.swift
//  Nikin_App
//
//  Created by Lucas Freitas de Oliveira on 11/13/15.
//  Copyright © 2015 Lucas Freitas de Oliveira. All rights reserved.
//

import UIKit

class EventsDetail: UIViewController {

    var event: Event!
    @IBOutlet weak var descriptionEvent: UITextView!
    @IBOutlet weak var titleEvent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionEvent.text = event.descriptionEvent
        titleEvent.text = event.title
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
