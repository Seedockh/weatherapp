//
//  CityViewController.swift
//  weatherapp
//
//  Created by Antoine Nivoy on 22/05/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import UIKit
import MapKit

class CityViewController: UIViewController {

    var city: MKPointAnnotation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = city?.title
    }
}
