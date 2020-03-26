//
//  HourlyPresenter.swift
//  Vipercast
//
//  Created by rl on 02/03/2020.
//  Copyright © 2020 rl. All rights reserved.
//

import Foundation

class HourlyPresenter: HourlyPresenterProtocol {
    
    weak var view: HourlyViewProtocol!
    var interactor: HourlyInteractorProtocol!
    var router: HourlyRouterProtocol!
    
    required init(view: HourlyViewProtocol) {
        self.view = view
    }
    
    func closeButtonClicked() {
        router.closeCurrentViewController()
    }
}
