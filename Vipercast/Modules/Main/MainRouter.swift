//
//  MainRouter.swift
//  Vipercast
//
//  Created by rl on 28/02/2020.
//  Copyright © 2020 rl. All rights reserved.
//

//import Foundation
import UIKit

class MainRouter: MainRouterProtocol {
    weak var viewController: MainViewController!
    var data: [ViewForecastHour] = []
    
    init(viewController: MainViewController) {
        self.viewController = viewController
    }
    
    func showHourlyScene(segueName: String, data: [ViewForecastHour]) {
        self.data = data
        viewController.performSegue(withIdentifier: segueName, sender: nil)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? HourlyViewProtocol {
            vc.tableData = data
        }
    }
}
