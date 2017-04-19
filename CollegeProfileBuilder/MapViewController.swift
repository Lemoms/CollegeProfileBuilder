//
//  MapViewController.swift
//  CollegeProfileBuilder
//
//  Created by Leimomi H. Podell on 4/18/17.
//  Copyright © 2017 Leimomi H. Podell. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var CollegeMap: MKMapView!
    let locationManager = CLLocationManager()
    let collegeAnnotaion = MKPointAnnotation()
    var initialRegion : MKCoordinateRegion!
    var isInitialView : Bool = true
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CollegeMap.delegate = self
        locationManager.requestWhenInUseAuthorization()
        CollegeMap.showsUserLocation = true
        let latitude : Double = 42.0811
        let longitude : Double = 88.0729
        let coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        collegeAnnotaion.coordinate = coordinate
        collegeAnnotaion.title = "Harper College"
        collegeAnnotaion.subtitle = "Gotta get some credits"
        CollegeMap.addAnnotation(collegeAnnotaion)
        
    }
    
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
        if annotation.isEqual(CollegeMap.userLocation)
        {
            return nil
        }
        var pin = MKAnnotationView(annotation: annotation, reuseIdentifier: nil)
        if annotation.isEqual(collegeAnnotaion)
        {
            pin.image = UIImage(named: "Harper")
        }
        else
        {
            pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: nil)
        }
        
        pin.canShowCallout = true
        let button = UIButton(type: . detailDisclosure)
        pin.rightCalloutAccessoryView = button
        return pin
        
    }

    
    
    @IBAction func MapButton(_ sender: UIBarButtonItem) {
        CollegeMap.setRegion(initialRegion, animated: true)
    }
   
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl){
        let coordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let center = view.annotation?.coordinate
        let region = MKCoordinateRegion(center: center!, span: coordinateSpan)
        CollegeMap.setRegion(region, animated: true)
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        if isInitialView
        {
            initialRegion = MKCoordinateRegion(center: mapView.centerCoordinate, span: mapView.region.span)
            isInitialView = false
        }
    }

   

}
