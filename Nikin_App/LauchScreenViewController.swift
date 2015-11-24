//
//  LauchScreenViewController.swift
//  Nikin_App
//
//  Created by Lucas Freitas de Oliveira on 11/20/15.
//  Copyright © 2015 Lucas Freitas de Oliveira. All rights reserved.
//

import UIKit

class LauchScreenViewController: UIViewController {

    override func viewDidLoad() {
        
         super.viewDidLoad()
        
        let topColor = UIColor(red: 221.0/255.0, green: 147.0/255.0, blue: 238.0/155.0, alpha: 1)
        let bottomColor = UIColor(red: 235.0/255.0, green: 211.0/255/0, blue: 239.0, alpha: 1)
        
        let gradientColors: [CGColor] = [topColor.CGColor, bottomColor.CGColor]
        let gradientLocations: [Float] = [0.0, 1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)

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
