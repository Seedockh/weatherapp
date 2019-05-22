//
//  CityViewController.swift
//  weatherapp
//
//  Created by Antoine Nivoy on 22/05/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import UIKit
import MapKit

class CityViewController: UIViewController {

    var city: MKPointAnnotation!
    var weatherDetails : WeatherDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = city.title
        getForecastWeather()
    }
    
    func getForecastWeather() {
        APIHandler.requestForecastWeather(latitude: city.coordinate.latitude, longitude: city.coordinate.longitude, success: { (data) in
            let decoder = JSONDecoder()
            self.weatherDetails = try? decoder.decode(WeatherDetails.self, from: data)
            print(self.weatherDetails!)
        }) { (error) in
            print(error)
        }
    }
}
