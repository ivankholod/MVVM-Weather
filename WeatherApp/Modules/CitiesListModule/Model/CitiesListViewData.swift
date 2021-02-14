//
//  CitiListViewData.swift
//  WeatherApp
//
//  Created by Ivan on 26.01.2021.
//

import Foundation
import SwiftyJSON

enum CitiesViewData {
    case loading(Bool)
    case success
    case failure(String)
    
    struct CityWeatherModel {
        var name: String
        var id: Int
        var feelsLike: String
        var pressure: String
        var temp: String
        var tempMin : String
        var humidity: String
        var tempMax: String
        
        init (json: JSON) {
            self.name = json["name"].stringValue
            self.id = json["id"].intValue
            
            let main = json["main"]
            self.feelsLike = main["feels_like"].stringValue
            self.pressure = main["pressure"].stringValue
            self.temp = main["temp"].stringValue
            self.tempMin = main["temp_min"].stringValue
            self.humidity = main["humidity"].stringValue
            self.tempMax = main["temp_max"].stringValue
        }
    }
}
