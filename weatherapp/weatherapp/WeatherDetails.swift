//
//  WeatherDetails.swift
//  weatherapp
//
//  Created by efrei on 22/05/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import Foundation

struct WeatherDetails: Decodable {

    struct HourlyDetails: Decodable {
        var time: Double
        var icon: String
        var humidity: Float
        var temperature: Float
    }

    struct DailyDetails: Decodable {
        var time: Double
        var icon: String
        var temperatureMin: Float
        var temperatureMax: Float
    }
    
     struct Currently: Decodable {
         var icon: String
         var temperature: Float
         var summary: String
         var windSpeed: Float
         var pressure: Float
         var humidity: Float
         var uvIndex: Int8
     }
 
    struct Hourly: Decodable {
        var summary: String
        var data: [HourlyDetails]
    }
    
    struct Daily: Decodable {
        var summary: String
        var data: [DailyDetails]
    }

    var hourly: Hourly
    var daily: Daily
    var currently: Currently
}
