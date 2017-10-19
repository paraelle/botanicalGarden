//
//  MapController.swift
//  BotanicalGarden
//
//  Created by paraelle on 18.05.2017.
//  Copyright © 2017 paraelle. All rights reserved.
//

import UIKit
import MapKit

class MapController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var pickerView: UIPickerView!
    var locationManager:CLLocationManager!
    
    let filter = ["All", "Flowers", "Trees", "Bushes"]

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
        let initialLocation = CLLocation(latitude: 51.116096, longitude: 17.047801)
        let regionRadius: CLLocationDistance = 300
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 1.5)
            mapView.setRegion(coordinateRegion, animated: true)
        }
        centerMapOnLocation(location: initialLocation)
    }

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
