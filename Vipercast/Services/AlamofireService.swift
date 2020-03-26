//
//  ServerService.swift
//  Vipercast
//
//  Created by rl on 28/02/2020.
//  Copyright © 2020 rl. All rights reserved.
//

//import Foundation
import Alamofire

class AlamofireService: NetworkServiceProtocol {
    // MARK: - ServerServiceProtocol methods
    
    func getForecast(completion: @escaping (NetworkForecast?, Error?) -> ()) {
        if let url = URL(string: URLForecast) {
            getJSON(URL: url, completion: completion)
        }
    }
    
    func getIcon(icon: String, completion: @escaping (Data?, Error?) -> ()) {        
        if let url = URL(string: URLIcon.replacingOccurrences(of: "<icon>", with: icon)) {
            getIcon(URL: url, completion: completion)
        }
    }
    
    // MARK: - Private methods
        
    private func getJSON(URL: URL, completion: @escaping (NetworkForecast?, Error?) -> ()) {
        let headers: HTTPHeaders = ["X-Yandex-API-Key": "b868e645-e501-4270-a2f9-1f9f5880d4e0"]
        AF.request(URLForecast, headers: headers)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: NetworkForecast.self) { (response) in
                completion(response.value, response.error)
        }
    }
    
    private func getIcon(URL: URL, completion: @escaping (Data?, Error?) -> ()) {
        AF.request(URL)
            .validate(statusCode: 200..<300)
            .responseData { (data) in
                completion(data.value, data.error)
        }
            
    }
    
    private let URLForecast = "https://api.weather.yandex.ru/v1/forecast?lat=57.990882&lon=56.20543&limit=7&extra=true"
    
    private let URLIcon = "https://yastatic.net/weather/i/icons/blueye/color/svg/<icon>.svg"

}
