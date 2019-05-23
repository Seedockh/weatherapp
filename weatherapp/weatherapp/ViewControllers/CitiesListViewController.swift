//
//  CitiesListViewController.swift
//  
//
//  Created by efrei on 22/05/2019.
//

import UIKit
import MapKit
import CoreLocation

class CitiesListViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func closeView(_ sender: Any) {
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            self.navigationItem.leftBarButtonItem?.customView?.transform = CGAffineTransform(rotationAngle: .pi)
        }, completion: { (finished) in
            _ = self.navigationController?.popViewController(animated: true)
        })
    }
    @IBAction func switchSort(sender: UISegmentedControl) {  // Sorts cities by distance
        switch sender.selectedSegmentIndex {
        case 0:
            leftPanel = true
            cities.sort { $0.name < $1.name }
            self.tableView.reloadData()
        case 1:
            leftPanel = false
            if CLLocationManager.locationServicesEnabled() {
                locationManager = CLLocationManager()
                locationManager.delegate = self as? CLLocationManagerDelegate
                locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                
                if CLLocationManager.authorizationStatus().rawValue >= 3 { // If location is authorized
                    if let userLoc = locationManager.location {
                        let userCoords: CLLocation = CLLocation(
                            latitude: userLoc.coordinate.latitude,
                            longitude: userLoc.coordinate.longitude
                        )
                        cities.sort {
                            userCoords.distance(from: CLLocation(
                                latitude: $0.coordinates.latitude,
                                longitude: $0.coordinates.longitude )) <
                                userCoords.distance(from: CLLocation(
                                    latitude: $1.coordinates.latitude,
                                    longitude: $1.coordinates.longitude ))
                        }
                    }
                } else {
                    cities.sort { $0.name < $1.name }
                }
                self.tableView.reloadData()
            }

        default:
            break
        }
    }
    
    var leftPanel: Bool = true
    var locationManager = CLLocationManager()
    var cities = Lists.cities
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        cities.sort { $0.name < $1.name }
        tableView.dataSource = self
        title = "Cities"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cityCell = tableView.dequeueReusableCell(withIdentifier: "CityCell",for:indexPath) as? CityCell {
            if !leftPanel, let userLoc = locationManager.location {
                cityCell.configure(withCityName: cities[indexPath.row].name, withDistance:
                    CLLocation(latitude: userLoc.coordinate.latitude, longitude: userLoc.coordinate.longitude)
                        .distance(from: CLLocation(latitude: cities[indexPath.row].coordinates.latitude,longitude: cities[indexPath.row].coordinates.longitude )) )
            } else {
                cityCell.configure(withCityName: cities[indexPath.row].name, withDistance: 0 )
            }
            return cityCell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "CityListSegue", sender: cities[indexPath.item])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CityListSegue" {
            if let cityVC = segue.destination as? CityViewController, let indexPath = tableView.indexPathForSelectedRow {
                let pin = MKPointAnnotation()
                pin.coordinate = cities[indexPath.item].coordinates
                pin.title = cities[indexPath.item].name
                cityVC.city = pin
            }
        }
    }
}
