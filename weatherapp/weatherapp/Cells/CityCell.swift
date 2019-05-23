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
    
    func configure(withCityName name: String) {
        nameLabel.text = name
    }
    
}
