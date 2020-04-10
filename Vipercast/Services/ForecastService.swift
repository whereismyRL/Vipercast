//
//  ForecastService.swift
//  Vipercast
//
//  Created by rl on 28/02/2020.
//  Copyright © 2020 rl. All rights reserved.
//

//import Foundation

class ForecastService: ForecastServiceProtocol {  
    var forecast: [ViewForecastFull] = []
    let storageService: StorageServiceProtocol = RealmService()
    
    init() {
        loadFromStorage()
    }
    
    private func loadFromStorage() {
        forecast = storageService.loadForecast().map{
            ViewForecastFull(
                day: ViewForecast(date: "\($0.date)",
                    dayTemp: $0.day_temp,
                    nightTemp: $0.night_temp,
                    feelsLike: $0.day_temp,
                    icon: $0.icon,
                    condition: $0.condition,
                    windDir: $0.wind_dir,
                    windSpeed: $0.wind_speed),
                hourly: $0.hours.map{
                    ViewForecastHour(hour: $0.hour,
                                   temp: $0.temp,
                                   feelsLike: $0.temp,
                                   icon: $0.icon,
                                   condition: $0.condition,
                                   windDir: $0.wind_dir,
                                   windSpeed: $0.wind_speed)
            })
        }
    }
    
    func saveToStorage(forecast: NetworkForecast) {
        let data: [StorageForecastList] = forecast.forecasts.map {
            let fl = StorageForecastList()
            fl.date = $0.date_ts
            fl.day_temp = $0.parts.day_short.temp
            fl.night_temp = $0.parts.night_short.temp
            fl.icon = $0.parts.day_short.icon
            fl.condition = $0.parts.day_short.condition
            fl.wind_speed = $0.parts.day_short.wind_speed
            fl.wind_dir = $0.parts.day_short.wind_dir
                        
            for hour in $0.hours {
                let hourForecast = StorageForecastHourList()
                hourForecast.hour = Int(hour.hour)!
                hourForecast.temp = hour.temp
                hourForecast.icon = hour.icon
                hourForecast.condition = hour.condition
                fl.hours.append(hourForecast)
            }

            return fl
        }
        storageService.saveForecast(data: data)
        loadFromStorage()
    }
    
    func getDaily() -> [ViewForecast] {
        return forecast.map{
            $0.day
        }
    }
    
    func getHourly(day: Int) -> [ViewForecastHour] {
        return forecast[day].hourly
    }
}
