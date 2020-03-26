//
//  HourlyInteractor.swift
//  Vipercast
//
//  Created by rl on 02/03/2020.
//  Copyright © 2020 rl. All rights reserved.
//

import Foundation

class HourlyInteractor: HourlyInteractorProtocol {
    
    weak var presenter: HourlyPresenterProtocol!
    
    init(presenter: HourlyPresenterProtocol) {
        self.presenter = presenter
    }

}
