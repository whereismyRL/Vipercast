//
//  MainInteractor.swift
//  Vipercast
//
//  Created by rl on 28/02/2020.
//  Copyright © 2020 rl. All rights reserved.
//

//import Foundation

class MainInteractor: MainInteractorProtocol {
    
    weak var presenter: MainPresenterProtocol!
    let forecastService: ForecastServiceProtocol = ForecastService()
    let networkService: NetworkServiceProtocol = AlamofireService()
    
    var forecast: [ViewForecast] {
        get {
            let dailyForecast = forecastService.getDaily()
            for dayCondition in dailyForecast {
                downloadIcon(icon: dayCondition.icon)
            }
            return dailyForecast
        }
    }
    
    init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }

    func checkForecastUpdate() {
        networkService.getForecast { (json, error) in
            if let response = json {
                self.forecastService.saveToStorage(forecast: response)
                self.presenter.updateView()
            }
        }
    }
    
    func downloadIcon(icon: String) {
        networkService.getIcon(icon: icon, completion: { (data, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let data = data {
                self.presenter.updateIcon(icon: icon, data: data)
            }
        })
    }
    
    func getHourlyForecast(day: Int) -> [HourlyForecast] {
        return forecastService.getHourly(day: day)
    }

}
