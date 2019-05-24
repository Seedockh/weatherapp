//
//  HourlyCell.swift
//  weatherapp
//
//  Created by Antoine Nivoy on 22/05/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import UIKit
import SDWebImage

class HourlyCell: UITableViewCell {
    
    @IBOutlet weak var hour: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var temperature: UILabel!
    
    func configure(withWeatherDetails weatherDetails: WeatherDetails?, index: Int) {
        let date = NSDate(timeIntervalSince1970: weatherDetails?.hourly.data[index].time ?? 0)
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("HH")
        hour.text = "\(dateFormatter.string(from: date as Date))h"
        let localUrl = "\(weatherDetails?.hourly.data[index].icon ?? "").png"
        weatherIcon.image = UIImage(named: localUrl)
        humidity.text = "\(Int((weatherDetails?.hourly.data[index].humidity ?? 0) * 100))%"
        temperature.text = "\(Int(weatherDetails?.hourly.data[index].temperature ?? 0))°C"
    }
    
}
