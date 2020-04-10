//
//  ServiceProtocols.swift
//  Vipercast
//
//  Created by rl on 28/02/2020.
//  Copyright © 2020 rl. All rights reserved.
//

import Foundation

protocol ForecastServiceProtocol: class {
    var forecast: [ViewForecastFull] { set get }
    func saveToStorage(forecast: NetworkForecast)
    func getDaily() -> [ViewForecast]
    func getHourly(day: Int) -> [ViewForecastHour]
}

protocol NetworkServiceProtocol: class {
    func getForecast(completion: @escaping (NetworkForecast?, Error?) -> ())
    
    func getIcon(icon: String, completion: @escaping (Data?, Error?) -> ())
}
