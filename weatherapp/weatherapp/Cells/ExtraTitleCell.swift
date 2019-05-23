//
//  ExtraTitleCell.swift
//  weatherapp
//
//  Created by Antoine Nivoy on 22/05/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import UIKit

class ExtraTitleCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    
    func configure(withWeatherDetails weatherDetails: WeatherDetails?) {
        title.text = "Extra Informations"
    }
    
}
