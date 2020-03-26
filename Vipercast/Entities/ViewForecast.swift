//
//  ViewForecast.swift
//  Vipercast
//
//  Created by rl on 29/02/2020.
//  Copyright © 2020 rl. All rights reserved.
//

import Foundation

struct ViewForecast {
    let date: String
    let dayTemp: Int
    let nightTemp: Int
    let feelsLike: Int
    let icon: String
    let condition: String
    let windDir: String
    let windSpeed: Double
}

struct HourlyForecast {
    let hour: Int
    let temp: Int
    let feelsLike: Int
    let icon: String
    let condition: String
    let windDir: String
    let windSpeed: Double
}

struct FullForecast {
    let day: ViewForecast
    let hourly: [HourlyForecast]
}

struct UIForecast {
    let day: String
    let isWeekend: Bool
    let date: String
    let dayTemp: String
    let nightTemp: String
    let condition: String
    let wind: String
    let icon: String
}
