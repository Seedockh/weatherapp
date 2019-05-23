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
    @IBAction func switchSort(sender: UISegmentedControl) {  // Sorts cities by distance
        switch sender.selectedSegmentIndex {
        case 0:
            cities.sort { $0.name < $1.name }
            self.tableView.reloadData()
        case 1:
            if CLLocationManager.locationServicesEnabled() {
                locationManager = CLLocationManager()
                locationManager.delegate = self as? CLLocationManagerDelegate
                locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                
                if CLLocationManager.authorizationStatus().rawValue == 3 { // If location is authorized
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
    
    var locationManager = CLLocationManager()
    var cities = Lists.cities
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        cities.sort { $0.name < $1.name }
        tableView.dataSource = self
        title = "Cities"
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last! as CLLocation
        print("Location : \(location)")
        //self.map.setRegion(region, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cityCell = tableView.dequeueReusableCell(withIdentifier: "CityCell",for:indexPath) as? CityCell {
            cityCell.configure(withCityName: cities[indexPath.row].name)
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
