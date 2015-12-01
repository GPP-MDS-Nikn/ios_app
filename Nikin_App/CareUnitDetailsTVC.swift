//
//  CareUnitDetailsTVC.swift
//  Nikin_App
//
//  Created by Lucas Freitas de Oliveira on 11/30/15.
//  Copyright © 2015 Lucas Freitas de Oliveira. All rights reserved.
//

import UIKit
import Contacts
import MapKit

class CareUnitDetailsTVC: UITableViewController, MKMapViewDelegate, CLLocationManagerDelegate, TTTAttributedLabelDelegate {
    
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var siteButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var zipCodeLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var descriptionText: UITextView!
    
    var careUnit: CareUnit!
    var mapVC: CareUnitMapVC!
    var userLocationVar: CLLocation?
    let regionRadius: CLLocationDistance = 10

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = careUnit.name
        addressLabel.text = careUnit.address
        cityLabel.text = careUnit.city
        districtLabel.text = careUnit.district
        zipCodeLabel.text = careUnit.zipCode
        descriptionText.text = careUnit.descriptionCareUnit
        emailButton.setTitle(careUnit.email, forState: .Normal)
        siteButton.setTitle(careUnit.site, forState: .Normal)
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        
        
        let initialLocation = CLLocation(latitude: careUnit.coordinate.latitude, longitude: careUnit.coordinate.longitude)
        print("LATITUDE: ", careUnit.coordinate.latitude)
        print("LONGITUDE: ", careUnit.coordinate.longitude)
        centerMapOnLocation(initialLocation)
        
        let artwork = Artwork(title: careUnit.name, locationName: careUnit.institution, coordinate: careUnit.coordinate)
        mapView.addAnnotation(artwork)
        
        //calculateDistance()
    }
    
    override func viewDidAppear(animated: Bool) {
     //    NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(3), target: self, selector: "calculateDistance", userInfo: nil, repeats: false)
    }

    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 150.0, regionRadius * 150.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    @IBAction func directionsButton(sender: AnyObject) {
        
//        let placemark = MKPlacemark(coordinate: careUnit.coordinate, addressDictionary: nil)
//        var mapItem = MKMapItem(placemark: placemark)
        
        //let location = CLLocation(latitude: careUnit.coordinate.latitude, longitude: careUnit.coordinate.longitude)
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        mapItem().openInMapsWithLaunchOptions(launchOptions)
        
    }
    
    func mapItem() -> MKMapItem {
        let addressDictionary = [String(CNPostalAddressStreetKey): careUnit.institution]
        let placemark = MKPlacemark(coordinate: careUnit.coordinate, addressDictionary: addressDictionary)
        
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        
        return mapItem
    }
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        print(mapView.userLocation.coordinate.latitude)
        print(mapView.userLocation.coordinate.longitude)
        
        let careUnitLocation = CLLocation(latitude: careUnit.coordinate.latitude, longitude: careUnit.coordinate.longitude)
        let distanceFromUser = careUnitLocation.distanceFromLocation(userLocation.location!)/1000
        let string:String = String(format: "%.2f", distanceFromUser)
        
        distanceLabel.text = string + " Km"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return 1
        case 1:
            return 3
        case 2:
            return 3
        default:
            break
        }
        return 0
    }

    @IBAction func openSite(sender: AnyObject) {
        
        var url : NSURL;
        url = NSURL(string:careUnit.site)!;
        
        UIApplication.sharedApplication().openURL(url)
        
    }
    
    @IBAction func sendEmail(sender: AnyObject) {
    }
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
