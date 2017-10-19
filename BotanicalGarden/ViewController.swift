//
//  ViewController.swift
//  BotanicalGarden
//
//  Created by paraelle on 17.05.2017.
//  Copyright © 2017 paraelle. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        // Pin the restaurant location on map
/*        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(restaurant.location, completionHandler: { placemarks, error in
            if let error = error {
                print(error)
                return
            }
            
            if let placemarks = placemarks {
                // Get the first placemark
                let placemark = placemarks[0]
                
                // Add annotation
                let annotation = MKPointAnnotation()
                
                if let location = placemark.location {
                    // Display the annotation
                    annotation.coordinate = location.coordinate
                    self.mapView.addAnnotation(annotation)
                    
                    // Set the zoom level
                    let region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 250, 250)
                    self.mapView.setRegion(region, animated: false)
                }
            }
            
        })
    }

*/
        
/*        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString("Plac Bema, Wroclaw, Poland", completionHandler: {placemarks, error in
            if error != nil {
            print(error)
            return}})

        MKPointAnnotation*    annotation = [[MKPointAnnotation alloc], init];
        CLLocationCoordinate2D myCoordinate;
        myCoordinate.latitude=13.04016;
        myCoordinate.longitude=80.243044;
        annotation.coordinate = myCoordinate;
        [self.mapView addAnnotation:annotation];

        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        let regionRadius: CLLocationDistance = 1000
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
            mapView.setRegion(coordinateRegion, animated: true)
        }
        centerMapOnLocation(location: initialLocation)
*/    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

