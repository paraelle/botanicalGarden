//
//  MapController.swift
//  BotanicalGarden
//
//  Created by paraelle on 18.05.2017.
//  Copyright © 2017 paraelle. All rights reserved.
//

import UIKit
import MapKit
import Firebase

class MapController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var pickerView: UIPickerView!
    var locationManager:CLLocationManager!
//    let plantsRef = Firebase.Database.database().reference().child("plants")
    
    
    var plants : [Plant] = []
    
    let filter = ["Perennials", "Trees"]

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return filter[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return filter.count
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.mapView.delegate = self;
        //self.mapView.showsUserLocation = YES;
  //      observePlants();
        let initialLocation = CLLocation(latitude: 51.116096, longitude: 17.047801)
        let regionRadius: CLLocationDistance = 300
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 1.5)
            mapView.setRegion(coordinateRegion, animated: true)
        }
        centerMapOnLocation(location: initialLocation)

        
        for var i in(0..<plants.count){
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: plants[i].latitude, longitude: plants[i].longitude)
            //annotation.title = plants[i].name
            annotation.subtitle = plants[i].name
            mapView.addAnnotation(annotation)
        }
    }
    
//    func observePlants() {
//        plantsRef.observe(.value, with: {(snapshot) in
//            let values = snapshot.value as! [NSDictionary?]
//            for var (index, obj) in values.enumerated() {
//                if let d = obj {
//                    self.plants.append(Plant(id: index, d: d))
//                }
//            }
//        })
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(){
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
