//
//  DailyCell.swift
//  weatherapp
//
//  Created by Antoine Nivoy on 22/05/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import UIKit
import SDWebImage

class DailyCell: UITableViewCell {
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    
    func configure(withWeatherDetails weatherDetails: WeatherDetails?, index: Int) {
        let date = NSDate(timeIntervalSince1970: weatherDetails?.daily.data[index].time ?? 0)
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("EEEE")
        dayLabel.text = "\(dateFormatter.string(from: date as Date))"
        weatherIcon.image = UIImage(named: "\(weatherDetails?.daily.data[index].icon ?? "").png")
        maxTempLabel.text = "\(Int(weatherDetails?.daily.data[index].temperatureMax ?? 0))°C"
        minTempLabel.text = "\(Int(weatherDetails?.daily.data[index].temperatureMin ?? 0))°C"
    }
    
}
