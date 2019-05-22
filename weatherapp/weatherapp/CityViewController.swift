//
//  CityViewController.swift
//  weatherapp
//
//  Created by Antoine Nivoy on 22/05/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import UIKit
import MapKit

class CityViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var city: MKPointAnnotation!
    var weatherDetails : WeatherDetails?
    
    enum Section: Int {
        case header
        case hourlyText
//        case hourly
//        case dailyText
//        case daily
//        case extraTitle
//        case extra
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = city.title
        tableView.dataSource = self
        getForecastWeather()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func getForecastWeather() {
        APIHandler.requestForecastWeather(latitude: city.coordinate.latitude, longitude: city.coordinate.longitude, success: { (data) in
            let decoder = JSONDecoder()
            self.weatherDetails = try? decoder.decode(WeatherDetails.self, from: data)
            self.tableView.reloadData()
        }) { (error) in
            print(error)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section(rawValue: section)! {
            case .header:
                return 1
            case .hourlyText:
                return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Section(rawValue: indexPath.section)! {
        case .header:
            print("case header")
            if let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell_ID", for: indexPath) as? HeaderCell {
                cell.configure(withWeatherDetails: weatherDetails)
                return cell
            }
        case .hourlyText:
            print("case hourlyText")
            if let cell = tableView.dequeueReusableCell(withIdentifier: "HourlyTextCell_ID", for: indexPath) as? HourlyTextCell {
                cell.configure(withWeatherDetails: weatherDetails)
                return cell
            }
        }
        return UITableViewCell()
    }
}
