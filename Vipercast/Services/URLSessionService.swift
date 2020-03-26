//
//  URLSessionService.swift
//  Vipercast
//
//  Created by rl on 28/02/2020.
//  Copyright © 2020 rl. All rights reserved.
//

import Foundation

class URLSessionService: NetworkServiceProtocol {  
    
    // MARK: - ServerServiceProtocol methods
    
    func getForecast(completion: @escaping (NetworkForecast?, Error?) -> ()) {
        if let url = URL(string: URLForecast) {
            getJSON(URL: url, completion: completion)
        }
    }
    
    func getIcon(icon: String, completion: @escaping (Data?, Error?) -> ()) {
        print(URLIcon.replacingOccurrences(of: "<icon>", with: icon))
    }
    
    // MARK: - Private methods
        
    private func getJSON(URL: URL, completion: @escaping (NetworkForecast?, Error?) -> ()) {
        let sharedSession = URLSession.shared
        var request = URLRequest(url: URL)
        request.setValue("b868e645-e501-4270-a2f9-1f9f5880d4e0", forHTTPHeaderField: "X-Yandex-API-Key")
        

        let dataTask = sharedSession.dataTask(with: request, completionHandler: { (data, response, error) -> () in
            
            
            if error != nil {
                print("Error to load: \(String(describing: error?.localizedDescription))")
                completion(nil, error)
                return
            }
            
            if let dataResponse = data {
                do {
                    let json = try JSONDecoder().decode(NetworkForecast.self, from: dataResponse)
                    
                    print("json: \(json), error: \(String(describing: error))")
                    completion(json, nil)
                    return
                    
                } catch let error {
                    print("Failed to load: \(error.localizedDescription)")
                    completion(nil, error)
                }
            }
        })
        dataTask.resume()
    }
    
    private let URLForecast = "https://api.weather.yandex.ru/v1/forecast?lat=57.990882&lon=56.20543&limit=7&extra=true"
    
    private let URLIcon = "https://yastatic.net/weather/i/icons/blueye/color/svg/<icon>.svg"
}
