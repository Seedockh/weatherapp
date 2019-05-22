//
//  DailyTextCell.swift
//  weatherapp
//
//  Created by Antoine Nivoy on 22/05/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import UIKit
import SDWebImage

class DailyTextCell: UITableViewCell {
    
    @IBOutlet weak var dailyText: UILabel!
    
    func configure(withWeatherDetails weatherDetails: WeatherDetails?) {
        dailyText.text = weatherDetails?.daily.summary
    }
    
}
