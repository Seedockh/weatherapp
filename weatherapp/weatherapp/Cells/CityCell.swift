//
//  CityCell.swift
//  weatherapp
//
//  Created by efrei on 22/05/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import UIKit
import SDWebImage

class CityCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    func configure(withCityName name: String, withDistance distance: Double) {
        nameLabel.text = name
        if distance==0 {
            distanceLabel.text = ""
        } else {
            distanceLabel.text = "\(Int(distance/1000)) km"
        }
    }
    
}
