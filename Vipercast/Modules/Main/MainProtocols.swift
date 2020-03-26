//
//  MainProtocols.swift
//  Vipercast
//
//  Created by rl on 28/02/2020.
//  Copyright © 2020 rl. All rights reserved.
//

import Foundation
import UIKit

protocol MainViewProtocol: class {
    func update(with data: [UIForecast])
    func updateIcon(icon: String, data: Data)
}

protocol MainPresenterProtocol: class {
    var router: MainRouterProtocol! { set get }
    func configureView()
    func updateView()
    func updateIcon(icon: String, data: Data)
    func tableCellClicked(day: Int)
}

protocol MainConfiguratorProtocol {
    func configure(with viewController: MainViewController)
}

protocol MainInteractorProtocol {
    var forecast: [ViewForecast] { get }
    func checkForecastUpdate()
    func downloadIcon(icon: String)
    func getHourlyForecast(day: Int) -> [HourlyForecast]
}

protocol MainRouterProtocol {
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
    func showHourlyScene(segueName: String, data: [HourlyForecast])
}

