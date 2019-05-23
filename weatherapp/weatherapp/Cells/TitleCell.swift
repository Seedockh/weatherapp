//
//  DailyTextCell.swift
//  weatherapp
//
//  Created by Antoine Nivoy on 22/05/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import UIKit
import SDWebImage

class TitleCell: UITableViewCell {
    
    @IBOutlet weak var TextLabel: UILabel!
    
    func configure(withWeatherDetails weatherDetails: WeatherDetails?, sender: String) {
        if sender == "DailyText" {
            TextLabel.text = weatherDetails?.daily.summary
        } else if sender == "HourlyText" {
            TextLabel.text = weatherDetails?.hourly.summary
        } else if sender == "ExtraTitle" {
            TextLabel.text = "Extra Informations"
        }
    }
}
