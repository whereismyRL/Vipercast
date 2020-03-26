//
//  HourlyConfigurator.swift
//  Vipercast
//
//  Created by rl on 02/03/2020.
//  Copyright © 2020 rl. All rights reserved.
//

import Foundation

class HourlyConfigurator: HourlyConfiguratorProtocol {
    
    func configure(with viewController: HourlyViewController) {
        let presenter = HourlyPresenter(view: viewController)
        let interactor = HourlyInteractor(presenter: presenter)
        let router = HourlyRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
