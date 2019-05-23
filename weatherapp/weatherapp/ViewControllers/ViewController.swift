//
//  ViewController.swift
//  weatherapp
//
//  Created by efrei on 22/05/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBAction func rotateAction(_ sender: Any) {
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            self.navigationItem.leftBarButtonItem?.customView?.transform = CGAffineTransform(rotationAngle: .pi)
        }, completion: { (finished) in
            self.navigationController?.pushViewController(self.storyboard?.instantiateViewController(withIdentifier: "CitiesList") as! CitiesListViewController, animated: true)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "WeatherApp"
        mapView.delegate = self
        for city in Lists.cities {
            let pin = MKPointAnnotation()
            pin.coordinate = city.coordinates
            pin.title = city.name
            mapView.addAnnotation(pin)
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView)
    {
        if let annotation = view.annotation as? MKPointAnnotation {
            performSegue(withIdentifier: "CitySegue_ID", sender: annotation)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CitySegue_ID" {
            if let CityViewController = segue.destination as? CityViewController {
                CityViewController.city = sender as? MKPointAnnotation
            }
        }
    }
}
