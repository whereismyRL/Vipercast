//
//  MainPresenter.swift
//  Vipercast
//
//  Created by rl on 28/02/2020.
//  Copyright © 2020 rl. All rights reserved.
//

import Foundation

class MainPresenter: MainPresenterProtocol {   
    weak var view: MainViewProtocol!
    var interactor: MainInteractorProtocol!
    var router: MainRouterProtocol!
    
    var data: [ViewForecast] {
        get {
            return interactor.forecast
        }
    }
    
    init(view: MainViewProtocol) {
        self.view = view
    }
    
    func configureView() {
        updateView()
        interactor.checkForecastUpdate()
    }
    
    func updateView() {
        
        view.update(with: data.map{
            
            let date = Date(timeIntervalSince1970: Double($0.date)!)
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "E"
            dateFormatter.locale = Locale(identifier: "ru_RU")
            let dayString = dateFormatter.string(from: date).capitalized
            dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "dMMM", options: 0, locale: .current)
            let dateString = dateFormatter.string(from: date)
            
            var windString = Winds.getName(wind: $0.windDir)
            if Winds.isWind(wind: $0.windDir) {
                windString.append(contentsOf: ", \(lround($0.windSpeed)) м/с")
            }
            
            return UIForecast(day: dayString,
                              isWeekend: Calendar(identifier: .gregorian).isDateInWeekend(date),
                              date: dateString,
                              dayTemp: "\($0.dayTemp)°",
                nightTemp: "ночью \($0.nightTemp)°",
                condition: Conditions.dict[$0.condition] ?? "?",
                wind: windString,
                icon: $0.icon
            )
        })
        
    }
    
    
    func updateIcon(icon: String, data: Data) {
        view.updateIcon(icon: icon, data: data)
    }
    
    func tableCellClicked(day: Int) {
        let data = interactor.getHourlyForecast(day: day)
        router.showHourlyScene(segueName: "HourlySegue", data: data)
    }
}
