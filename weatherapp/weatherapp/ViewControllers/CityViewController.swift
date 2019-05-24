//
//  CityViewController.swift
//  weatherapp
//
//  Created by Antoine Nivoy on 22/05/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import UIKit
import MapKit

class CityViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var city: MKPointAnnotation!
    var weatherDetails : WeatherDetails?
    
    enum Section: Int {
        case header
        case hourlyText
        case hourly
        case dailyText
        case daily
        case extraTitle
        case extra
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = city.title
        tableView.dataSource = self
        getForecastWeather()
    }
    
    func getForecastWeather() {
        let child = SpinnerViewController()
        // add the spinner view controller
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
        APIHandler.requestForecastWeather(latitude: city.coordinate.latitude, longitude: city.coordinate.longitude, success: { (data) in
            let decoder = JSONDecoder()
            self.weatherDetails = try? decoder.decode(WeatherDetails.self, from: data)
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
            self.tableView.reloadData()
        }) { (error) in
            print(error)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section(rawValue: section)! {
            case .header:
                return 1
            case .hourlyText:
                return 1
            case .hourly:
                var count = 0
                let date = NSDate(timeIntervalSince1970: weatherDetails?.hourly.data[count].time ?? 0)
                let dateFormatter = DateFormatter()
                dateFormatter.setLocalizedDateFormatFromTemplate("HH")
                var remain = Int("\(dateFormatter.string(from: date as Date))")!
                repeat {
                    count += 1
                    remain += 1
                } while remain <= 23
                return count
            case .dailyText:
                return 1
            case .daily:
                return weatherDetails?.daily.data.count ?? 0
            case .extraTitle:
                return 1
            case .extra:
                return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Section(rawValue: indexPath.section)! {
            case .header:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell_ID", for: indexPath) as? HeaderCell {
                    cell.configure(withWeatherDetails: weatherDetails)
                    cell.backgroundColor = UIColor.clear
                    let imageView = UIImageView(image: UIImage(named: "\(weatherDetails?.currently.icon ?? "")-wp.jpg"))
                    imageView.alpha = 0.6
                    tableView.backgroundView = imageView
                    return cell
                }
            case .hourlyText:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "HourlyTextCell_ID", for: indexPath) as? TitleCell {
                    cell.configure(withWeatherDetails: weatherDetails, sender: "HourlyText")
                    cell.backgroundColor = UIColor.clear
                    return cell
                }
            case .hourly:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "HourlyCell_ID", for: indexPath) as? HourlyCell {
                    cell.configure(withWeatherDetails: weatherDetails, index: indexPath.item)
                    cell.backgroundColor = UIColor.clear
                    return cell
                }
            case .dailyText:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "DailyTextCell_ID", for: indexPath) as? TitleCell {
                    cell.configure(withWeatherDetails: weatherDetails, sender: "DailyText")
                    cell.backgroundColor = UIColor.clear
                    return cell
                }
            case .daily:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "DailyCell_ID", for: indexPath) as? DailyCell {
                    cell.configure(withWeatherDetails: weatherDetails, index: indexPath.item)
                    cell.backgroundColor = UIColor.clear
                    return cell
                }
            case .extraTitle:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "ExtraTitleCell_ID", for: indexPath) as? TitleCell {
                    cell.configure(withWeatherDetails: weatherDetails, sender: "ExtraTitle")
                    cell.backgroundColor = UIColor.clear
                    return cell
                }
            case .extra:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "ExtraCell_ID", for: indexPath) as? ExtraCell {
                    cell.configure(withWeatherDetails: weatherDetails, index: indexPath.item)
                    cell.backgroundColor = UIColor.clear
                    return cell
                }
        }
        return UITableViewCell()
    }
}
