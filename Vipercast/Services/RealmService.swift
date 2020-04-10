//
//  RealmService.swift
//  Vipercast
//
//  Created by rl on 28/02/2020.
//  Copyright © 2020 rl. All rights reserved.
//

//import Foundation
import RealmSwift

protocol StorageServiceProtocol: class {
    func saveForecast(data: [StorageForecastList])
    func loadForecast() -> [StorageForecastList]
}

class RealmService: StorageServiceProtocol {
    let realm = try! Realm()
    
    @objc func saveForecast(data: [StorageForecastList]) {       
        try! realm.write{
            realm.deleteAll()
            realm.add(data)
        }
    }
    
    @objc func loadForecast() -> [StorageForecastList] {
        return realm.objects(StorageForecastList.self).sorted { $0.date < $1.date }
    }
}
