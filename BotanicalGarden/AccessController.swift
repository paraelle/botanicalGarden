//
//  AccessController.swift
//  BotanicalGarden
//
//  Created by paraelle on 18.05.2017.
//  Copyright © 2017 paraelle. All rights reserved.
//

import UIKit
import MapKit

class BusStop {
    
    var name: String
    var lat: Double
    var long: Double
    var bus: String
    
    init(name: String, lat: Double, long: Double, bus: String) {
        self.name = name
        self.lat = lat
        self.long = long
        self.bus = bus
    }
    
}

class MyPointAnnotation : MKPointAnnotation {
    var pinTintColor: UIColor?
}


class AccessController: UIViewController {
    
    @IBOutlet var mapView: MKMapView!
    var locationManager:CLLocationManager!
    var busStop = [BusStop(name: "Świętokrzyska", lat: 51.117292, long: 17.044257, bus: "128"),
                   BusStop(name: "Ogród Botaniczny", lat: 51.116819, long: 17.050309, bus: "9, 17"),
                   BusStop(name: "Ogród Botaniczny", lat: 51.117460, long: 17.051151, bus: "A, N, 128"),
                   BusStop(name: "Ogród Botaniczny", lat: 51.116590, long: 17.052131, bus: "9, 17"),
                   BusStop(name: "pl. Bema", lat: 51.117081, long: 17.043321, bus: "9, 17"),
                   BusStop(name: "pl. Bema", lat: 51.117464, long: 17.042096, bus: "6, 8, 11, 23"),
                   BusStop(name: "pl. Bema", lat: 51.116661, long: 17.041768, bus: "8, 9, 11, 17, 23"),
                   BusStop(name: "pl. Bema", lat: 51.117456, long: 17.040974, bus: "C, 128, 6"),
                   BusStop(name: "Katedra", lat: 51.114219, long: 17.050553, bus: "A, C, N"),
                   BusStop(name: "Katedra", lat: 51.113371, long: 17.050111, bus: "2, 10")]
    
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) ->
        MKAnnotationView? {
            let identifier = "MyPin"
            if annotation.isKind(of: MKUserLocation.self) {
                return nil
            }
            // Reuse the annotation if possible
            var annotationView:MKPinAnnotationView? =
                mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as?
            MKPinAnnotationView
            if annotationView == nil {
                annotationView = MKPinAnnotationView(annotation: annotation,
                                                     reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
                annotationView?.pinTintColor = .green
            }
            
           // if #available(iOS 9.0, *){

          //  } else {
          //      if #available(iOS 9.0, *) {
          //          annotationView?.pinTintColor = UIColor.red
         //       }
         //   }
            return annotationView
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        // Do any additional setup after loading the view.
        let initialLocation = CLLocation(latitude: 51.116096, longitude: 17.047801)
        let regionRadius: CLLocationDistance = 300
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 1.5)
            mapView.setRegion(coordinateRegion, animated: true)
        }
        centerMapOnLocation(location: initialLocation)

        for var i in(0..<busStop.count){
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: busStop[i].lat, longitude: busStop[i].long)
            annotation.title = busStop[i].name
            annotation.subtitle = busStop[i].bus
            mapView.addAnnotation(annotation)
            }
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(){
        self.dismiss(animated: true, completion: nil)
    }
    
}
