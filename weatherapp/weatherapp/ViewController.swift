//
//  ViewController.swift
//  weatherapp
//
//  Created by efrei on 22/05/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var weatherDetails : WeatherDetails?

    override func viewDidLoad() {
        super.viewDidLoad()
        getForecastWeather()
    }

    func getForecastWeather() {
        APIHandler.requestForecastWeather(latitude: "48", longitude: "2", success: { (data) in
            let decoder = JSONDecoder()
            self.weatherDetails = try? decoder.decode(WeatherDetails.self, from: data)
            print(self.weatherDetails!)
        }) { (error) in
            print(error)
        }
    }

}
