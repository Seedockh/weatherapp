//
//  HeaderCell.swift
//  weatherapp
//
//  Created by efrei on 22/05/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import UIKit
import SDWebImage

class HeaderCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var currentSum: UILabel!
    
    func configure(withWeatherDetails weatherDetails: WeatherDetails?) {
        let localUrl = "\(weatherDetails?.currently.icon ?? "").png"
        weatherIcon.image = UIImage(named: localUrl)
        currentTemp.text = "\(Int(weatherDetails?.currently.temperature ?? 0))°C"
        currentSum.text = weatherDetails?.currently.summary
    }

}
