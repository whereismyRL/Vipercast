//
//  StorageForecast.swift
//  Vipercast
//
//  Created by rl on 29/02/2020.
//  Copyright © 2020 rl. All rights reserved.
//

import Foundation
import RealmSwift

class StorageForecastList: Object {
    @objc dynamic var date = 0
    @objc dynamic var day_temp = 0
    @objc dynamic var night_temp = 0
    @objc dynamic var icon = ""
    @objc dynamic var condition = ""
    @objc dynamic var wind_speed = 0.0
    @objc dynamic var wind_dir = ""
    let hours = List<StorageForecastHourList>()
}

class StorageForecastHourList: Object {
    @objc dynamic var hour = 0
    @objc dynamic var temp = 0
    @objc dynamic var icon = ""
    @objc dynamic var condition = ""
    @objc dynamic var wind_speed = 0.0
    @objc dynamic var wind_dir = ""
}
