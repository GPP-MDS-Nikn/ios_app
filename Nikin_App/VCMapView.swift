//
//  VCMapView.swift
//  Nikin_App
//
//  Created by Lucas Freitas de Oliveira on 11/23/15.
//  Copyright © 2015 Lucas Freitas de Oliveira. All rights reserved.
//

import UIKit
import MapKit
import AddressBook

extension CareUnitMapVC: MKMapViewDelegate {
    
    // 1
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? Artwork {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
                as? MKPinAnnotationView { // 2
                    dequeuedView.annotation = annotation
                    view = dequeuedView
                    
            } else {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.animatesDrop = true
                view.image = UIImage(named: "mapMarker")
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: .DetailDisclosure) as UIView
            }
            return view
        }
        return nil
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showDetail" {
            let destinationViewController = segue.destinationViewController as! CareUnitDetailsTVC
            destinationViewController.careUnit = self.connect.returncareUnitsAtIndex(((sender as! MKAnnotationView).annotation as! Artwork).tag)
        }
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView,
        calloutAccessoryControlTapped control: UIControl) {
            
        self.performSegueWithIdentifier("showDetail", sender: view)

    }

    
}