//
//  LayoutHelper.swift
//  Nikin_App
//
//  Created by Lucas Freitas de Oliveira on 11/20/15.
//  Copyright © 2015 Lucas Freitas de Oliveira. All rights reserved.
//

import UIKit

class LayoutHelper: NSObject {

    static func adjustTabBarLayout () {
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor()], forState: .Selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor(red: 179.0/255.0, green: 77.0/255.0, blue: 208.0/255.0, alpha: 1.0)], forState: .Normal)
        
    }

}
