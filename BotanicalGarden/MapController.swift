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
import GoogleMaps

class Garden {
    var name: String?
    var boundary: [CLLocationCoordinate2D] = []
    
    var midCoordinate = CLLocationCoordinate2D()
    var overlayTopLeftCoordinate = CLLocationCoordinate2D()
    var overlayTopRightCoordinate = CLLocationCoordinate2D()
    var overlayBottomLeftCoordinate = CLLocationCoordinate2D()
    var overlayBottomRightCoordinate = CLLocationCoordinate2D()
    
    var overlayBoundingMapRect: MKMapRect?
}

class MapController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet var mapView: GMSMapView!
    @IBOutlet var pickerView: UIPickerView!
    var locationManager:CLLocationManager!
    
    let filter = ["All", "Perennials", "Trees"]

    var perennials: [Plant] = []
    var trees: [Plant] = []
    var all: [Plant] = []
    var plant: Plant!

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return filter[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return filter.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch filter[row] {
            case "Perennials":
                addPins(plants_list: self.perennials)
            case "Trees":
                addPins(plants_list: self.trees)
            case "All":
                addPins(plants_list: plantsService.plants)
            default:
                addPins(plants_list: plantsService.plants)
        }
    }

    override func loadView() {
        super.loadView()
        observePlants();
        let initialLocation = CLLocation(latitude: 51.116096, longitude: 17.047801)
        func centerMapOnLocation(location: CLLocation) {
            let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: 19)
            self.mapView.camera = camera
            print(self.mapView)
        }
        //pickerView.selectRow(0, inComponent: 0, animated: true)
        centerMapOnLocation(location: initialLocation)
    }

    func addPins(plants_list: [Plant]){
        self.mapView.clear()
        for plant in plants_list {
            let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: plant.latitude, longitude: plant.longitude))
            marker.title = plant.name
            marker.map = mapView
            print(plant.name)
        }
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyPin"

        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }

        // Reuse the annotation if possible
        var annotationView:MKPinAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView

        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        }

        let leftIconView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 53, height: 53))
        leftIconView.image = UIImage(named: plant.photo)
        annotationView?.leftCalloutAccessoryView = leftIconView
        annotationView?.pinTintColor = UIColor.orange

        return annotationView
    }
    
    class ParkMapOverlay: NSObject, MKOverlay {
        var coordinate: CLLocationCoordinate2D
        var boundingMapRect: MKMapRect
        
        init(garden: Garden) {
            boundingMapRect = garden.overlayBoundingMapRect!
            coordinate = garden.midCoordinate
        }
    }
    
    class ParkMapOverlayView: MKOverlayRenderer {
        var overlayImage: UIImage
        
        init(overlay:MKOverlay, overlayImage:UIImage) {
            self.overlayImage = overlayImage
            super.init(overlay: overlay)
        }
        
        override func draw(_ mapRect: MKMapRect, zoomScale: MKZoomScale, in context: CGContext) {
            guard let imageReference = overlayImage.cgImage else { return }
            
            let rect = self.rect(for: overlay.boundingMapRect)
            context.scaleBy(x: 1.0, y: -1.0)
            context.translateBy(x: 0.0, y: -rect.size.height)
            context.draw(imageReference, in: rect)
        }
    }
    
    func addOverlay() {
//        let overlay = ParkMapOverlay(garden: Garden())
//        mapView.add(overlay)
    }
    
    func loadSelectedOptions() {
//        mapView.removeOverlays(mapView.overlays)
        
//        for option in selectedOptions {
//            switch (option) {
//            case .mapOverlay:
//                addOverlay()
//            default:
//                break;
//            }
//        }
    }

    
    
    func observePlants() {
        plantsService.observe(handler: {(plants) in
            for plant in plants {
                if plant.type == "Perennial"{
                    self.perennials.append(plant)
                } else if plant.type == "Tree"{
                    self.trees.append(plant)
                }
            }
            self.addPins(plants_list: plantsService.plants)
        })
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
