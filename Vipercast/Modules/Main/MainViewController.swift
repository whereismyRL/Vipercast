//
//  ViewController.swift
//  Vipercast
//
//  Created by rl on 28/02/2020.
//  Copyright © 2020 rl. All rights reserved.
//

import UIKit
import SwiftSVG

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MainViewProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    var configurator: MainConfiguratorProtocol = MainConfigurator()
    var presenter: MainPresenterProtocol!
    var tableData: [UIForecast] = []
    
    var icons: [String: Data] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
    }
    
    func update(with data: [UIForecast]) {
        tableData = data
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func updateIcon(icon: String, data: Data) {
        if icons[icon] == nil {
            icons[icon] = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DayCell", for: indexPath) as? DaysTableViewCell else {
            return UITableViewCell()
        }
        let data = tableData[indexPath.row]
        cell.dayLabel.text = data.day
        cell.dayLabel.textColor = data.isWeekend ? .red : .label
        cell.dateLabel.text = data.date
        cell.dayTempLabel.text = data.dayTemp
        cell.nightTempLabel.text = data.nightTemp
        cell.conditionLabel.text = data.condition
        cell.windLabel.text = data.wind
                
        if let iconData = icons[data.icon] {
            let svg = UIView(SVGData: iconData) { (svgLayer) in
                svgLayer.resizeToFit(cell.svgView.bounds)
            }
            cell.svgView.addSubview(svg)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.tableCellClicked(day: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter.router.prepare(for: segue, sender: sender)
    }
    
}

