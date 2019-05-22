//
//  HourlyTextCell.swift
//  weatherapp
//
//  Created by efrei on 22/05/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import UIKit

class HourlyTextCell: UITableViewCell {

    @IBOutlet weak var hourlyText: UILabel!
    
    func configure(withWeatherDetails weatherDetails: WeatherDetails?) {
        hourlyText.text = weatherDetails?.hourly.summary
    }
    
}
