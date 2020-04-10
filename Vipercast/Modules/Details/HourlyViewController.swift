//
//  HourlyViewController.swift
//  Vipercast
//
//  Created by rl on 02/03/2020.
//  Copyright © 2020 rl. All rights reserved.
//

import UIKit

class HourlyViewController: UIViewController, UITableViewDataSource, HourlyViewProtocol {
    var presenter: HourlyPresenterProtocol!
    let configurator: HourlyConfiguratorProtocol = HourlyConfigurator()
    var tableData: [ViewForecastHour] = []
    
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        presenter.closeButtonClicked()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return max(tableData.count, 1)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HourCell", for: indexPath) as? HoursTableViewCell else {
            return UITableViewCell()
        }
        guard tableData.count > 0 else {
            cell.hourLabel.text = "нет данных"
            cell.tempLabel.text = "-"
            cell.conditionLabel.text = "-"
            return cell
        }
        let hour = tableData[indexPath.row]
        cell.hourLabel.text = "\(hour.hour):00"
        cell.tempLabel.text = "\(hour.temp)°"
        cell.conditionLabel.text = Helper.conditions[hour.condition] ?? "?"
        
        return cell
    }

}
