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
    @IBAction func switchSort() {
        print(">>> Switch sort")
    }
    
    var cities = Lists.cities
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        title = "Cities"
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
