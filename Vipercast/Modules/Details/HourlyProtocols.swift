//
//  HourlyProtocols.swift
//  Vipercast
//
//  Created by rl on 02/03/2020.
//  Copyright © 2020 rl. All rights reserved.
//

import Foundation

protocol HourlyViewProtocol: class {
    var tableData: [HourlyForecast] { set get }
}

protocol HourlyPresenterProtocol: class {
    func closeButtonClicked()
}

protocol HourlyInteractorProtocol: class {
}

protocol HourlyRouterProtocol: class {
    func closeCurrentViewController()
}

protocol HourlyConfiguratorProtocol: class {
    func configure(with viewController: HourlyViewController)
}
