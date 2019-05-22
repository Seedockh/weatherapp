//
//  ExtraCell.swift
//  weatherapp
//
//  Created by Antoine Nivoy on 22/05/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import UIKit

class ExtraCell: UITableViewCell {
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var firstValueLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var secondValueLabel: UILabel!
    
    func configure(withWeatherDetails weatherDetails: WeatherDetails?, index: Int) {
        if index == 0 {
            firstLabel.text = "Humidity"
            firstValueLabel.text = "\(Int((weatherDetails?.currently.humidity ?? 0) * 100))%"
            secondLabel.text = "Wind Speed"
            secondValueLabel.text = "\(weatherDetails?.currently.windSpeed ?? 0) km/h"
        }
        if index == 1 {
            firstLabel.text = "Pressure"
            firstValueLabel.text = "\(Int(weatherDetails?.currently.pressure ?? 0)) hPA"
            secondLabel.text = "UV Index"
            secondValueLabel.text = "\(weatherDetails?.currently.uvIndex ?? 0)"
        }
        
    }
    
}
