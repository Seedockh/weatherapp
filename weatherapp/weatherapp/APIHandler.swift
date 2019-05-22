//
//  APIHandler.swift
//  weatherapp
//
//  Created by efrei on 22/05/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import Foundation
import Alamofire

let apikey = "451e51968338c8eb04e7c551a6f3523f"

struct APIHandler {
    
    static func requestForecastWeather(latitude: Double, longitude: Double, success: @escaping (Data)->(), failure: @escaping (Error)->()) {
        Alamofire.request("https://api.darksky.net/forecast/\(apikey)/\(latitude),\(longitude)?units=si").responseData { (response) in
            switch response.result {
            case .success(let value):
                success(value)
            case .failure(let error):
                failure(error)
            }
        }
    }
}
