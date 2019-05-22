//
//  WeatherDetails.swift
//  weatherapp
//
//  Created by efrei on 22/05/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

/*
 - L’icon du temps
 - La température
 - Le résumé (summary) actuel
 - La force du vent
 - La pression
 - L’humidité
 - l’indice UV
 - Le texte du hourly forecast
 - Le texte du daily forecast
 - Un tableau d’éléments contenant les informations heures par heures (hourly) suivantes:
     - Le temps UNIX (nombre de secondes écoulées depuis le 1 janvier 1970)
     - L’icon du temps
     - L’humidité
     - La température
 Un tableau d’éléments contenant les informations jour par jour suivantes (daily) suivantes:
     - Le temps UNIX
     - L’icon du temps
     - La température minimum
     - La température maximum
 */

import Foundation

struct WeatherDetails: Decodable {

    // in "hourly.data"
    struct HourlyDetails: Decodable {
        var time: Int32
        var icon: String
        var humidity: Float
        var temperature: Float
    }
    // in "daily.data"
    struct DailyDetails: Decodable {
        var time: Int32
        var icon: String
        var temperatureMin: Float
        var temperatureMax: Float
    }
    
     // in currently
     struct Currently: Decodable {
         var icon: String
         var temperature: Float
         var summary: String
         var windSpeed: Float
         var pressure: Float
         var humidity: Float
         var uvIndex: Int8
     }
 
    // in hourly
    struct Hourly: Decodable {
        var summary: String
        var data: [HourlyDetails]
    }
    // in daily
    struct Daily: Decodable {
        var summary: String
        var data: [DailyDetails]
    }

    var hourly: Hourly
    var daily: Daily
    var currently: Currently
}

// EXAMPLE OF RESPONSE

/*
 {
     latitude: 48,
     longitude: 2,
     timezone: "Europe/Paris",
     currently: {
         time: 1558508392,
         summary: "Clear",
         icon: "clear-day",
         precipIntensity: 0,
         precipProbability: 0,
         temperature: 53.63,
         apparentTemperature: 53.63,
         dewPoint: 50.39,
         humidity: 0.89,
         pressure: 1020.7,
         windSpeed: 3.6,
         windGust: 6.08,
         windBearing: 35,
         cloudCover: 0.23,
         uvIndex: 1,
         visibility: 6.22,
         ozone: 351.39
     },
    hourly: {
     summary: "Partly cloudy throughout the day.",
     icon: "partly-cloudy-day",
     data: [
             {
                 time: 1558504800,
                 summary: "Clear",
                 icon: "clear-day",
                 precipIntensity: 0,
                 precipProbability: 0,
                 temperature: 50.13,
                 apparentTemperature: 50.13,
                 dewPoint: 48.58,
                 humidity: 0.94,
                 pressure: 1020.62,
                 windSpeed: 3.74,
                 windGust: 6.51,
                 windBearing: 16,
                 cloudCover: 0.09,
                 uvIndex: 1,
                 visibility: 6.22,
                 ozone: 354.78
             },
             {
                 time: 1558508400,
                 summary: "Clear",
                 icon: "clear-day",
                 precipIntensity: 0,
                 precipProbability: 0,
                 temperature: 53.64,
                 apparentTemperature: 53.64,
                 dewPoint: 50.4,
                 humidity: 0.89,
                 pressure: 1020.7,
                 windSpeed: 3.6,
                 windGust: 6.08,
                 windBearing: 35,
                 cloudCover: 0.23,
                 uvIndex: 1,
                 visibility: 6.22,
                 ozone: 351.38
             },
        ]
     },
     daily: {
         summary: "Light rain on Friday, with high temperatures peaking at 74°F on Sunday.",
         icon: "rain",
         data: [
            {
             time: 1558476000,
             summary: "Partly cloudy throughout the day.",
             icon: "partly-cloudy-day",
             sunriseTime: 1558498012,
             sunsetTime: 1558553603,
             moonPhase: 0.62,
             precipIntensity: 0,
             precipIntensityMax: 0.0002,
             precipIntensityMaxTime: 1558504800,
             precipProbability: 0,
             temperatureHigh: 69.94,
             temperatureHighTime: 1558533600,
             temperatureLow: 49,
             temperatureLowTime: 1558580400,
             apparentTemperatureHigh: 69.94,
             apparentTemperatureHighTime: 1558533600,
             apparentTemperatureLow: 49,
             apparentTemperatureLowTime: 1558580400,
             dewPoint: 48.55,
             humidity: 0.72,
             pressure: 1020.28,
             windSpeed: 3.35,
             windGust: 10.84,
             windGustTime: 1558486800,
             windBearing: 10,
             cloudCover: 0.32,
             uvIndex: 5,
             uvIndexTime: 1558522800,
             visibility: 8.08,
             ozone: 352.23,
             temperatureMin: 46.22,
             temperatureMinTime: 1558497600,
             temperatureMax: 69.94,
             temperatureMaxTime: 1558533600,
             apparentTemperatureMin: 46.22,
             apparentTemperatureMinTime: 1558497600,
             apparentTemperatureMax: 69.94,
             apparentTemperatureMaxTime: 1558533600
          },
        ]
     },
     flags: {
         sources: [
             "meteoalarm",
             "cmc",
             "gfs",
             "icon",
             "isd",
             "madis"
         ],
         meteoalarm-license: "Based on data from EUMETNET - MeteoAlarm [https://www.meteoalarm.eu/]. Time delays between this website and the MeteoAlarm website are possible; for the most up to date information about alert levels as published by the participating National Meteorological Services please use the MeteoAlarm website.",
         nearest-station: 10.39,
         units: "us"
     },
     offset: 2
}
 */
