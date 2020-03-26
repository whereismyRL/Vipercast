//
//  HourlyRouter.swift
//  Vipercast
//
//  Created by rl on 02/03/2020.
//  Copyright © 2020 rl. All rights reserved.
//

import Foundation

class HourlyRouter: HourlyRouterProtocol {
    
    weak var viewController: HourlyViewController!
    
    init(viewController: HourlyViewController) {
        self.viewController = viewController
    }
    
    func closeCurrentViewController() {
        viewController.dismiss(animated: true, completion: nil)
    }
}
