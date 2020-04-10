//
//  NetworkForecast.swift
//  Vipercast
//
//  Created by rl on 28/02/2020.
//  Copyright © 2020 rl. All rights reserved.
//

import Foundation

struct NetworkForecastDaypart: Decodable {
    let temp: Int
    let feels_like: Int
    let icon: String
    let condition: String
    let humidity: Int
    let wind_speed: Double
    let wind_dir: String
}

struct NetworkForecastHour: Decodable {
    let hour: String
    let temp: Int
    let feels_like: Int
    let icon: String
    let condition: String
    let humidity: Int
}

struct NetworkForecastParts: Decodable {
    let day_short: NetworkForecastDaypart
    let night_short: NetworkForecastDaypart
}

struct NetworkForecastDay: Decodable {
    let date_ts: Int
    let parts: NetworkForecastParts
    let hours: [NetworkForecastHour]
}

struct NetworkForecast: Decodable {
    let now: Int
    let forecasts: [NetworkForecastDay]
}
