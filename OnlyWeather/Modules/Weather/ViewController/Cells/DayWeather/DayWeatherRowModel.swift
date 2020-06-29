//
//  DayWeatherRowModel.swift
//  OnlyWeather
//
//  Created by Olga Lidman on 19.06.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class DayWeatherRowModel: RowModel {
    
    var temp = ""
    var pressure = 0
    var humidity = 0
    var windSpeed = 0
    var windDirection = 0.0
    var description = ""
    var time = 0
    var weekDay = ""
    var date = ""
    var sky = ""
    
    init(with weather: Weather) {
        self.temp = NSString(format:"%.1f", weather.temp) as String
        self.pressure = Int(weather.pressure / 1.333)
        self.humidity = weather.humidity
        self.windSpeed = Int(weather.windSpeed)
        self.windDirection = weather.windDeg
        self.description = weather.skyDescription
        self.time = weather.timeInt
        self.weekDay = weather.weekDay
        self.date = weather.datePretty
        self.sky = weather.sky
        super.init()
    }
    
    required init(id: String) {
        super.init(id: UUID().uuidString)
    }
}
