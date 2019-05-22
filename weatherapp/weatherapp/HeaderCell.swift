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
    
    func configure(withWeatherDetails weatherDetails: WeatherDetails?) {
        let localUrl = "./Icons/\(weatherDetails?.currently.icon ?? "").png"
        weatherIcon.image = UIImage(named: localUrl)
    }

}
