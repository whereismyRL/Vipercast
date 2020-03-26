//
//  NetworkForecast.swift
//  Vipercast
//
//  Created by rl on 28/02/2020.
//  Copyright © 2020 rl. All rights reserved.
//

import Foundation


struct DayForecast: Decodable {
    let date_ts: Int
    let parts: PartsForecast
    let hours: [HourForecast]
}

struct DaypartForecast: Decodable {
    let temp: Int
    let feels_like: Int
    let icon: String
    let condition: String
    let humidity: Int
    let wind_speed: Double
    let wind_dir: String
}

struct HourForecast: Decodable {
    let hour: String
    let temp: Int
    let feels_like: Int
    let icon: String
    let condition: String
    let humidity: Int
}

struct PartsForecast: Decodable {
    let day_short: DaypartForecast
    let night_short: DaypartForecast
}

struct NetworkForecast: Decodable {
    let now: Int
    let forecasts: [DayForecast]
}
