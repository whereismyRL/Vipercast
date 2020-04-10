//
//  Helper.swift
//  Vipercast
//
//  Created by rl on 02/03/2020.
//  Copyright © 2020 rl. All rights reserved.
//

class Conditions {
    static let dict: [String: String] = [
        "clear": "ясно",
        "partly-cloudy": "малооблачно",
        "cloudy": "облачно с прояснениями",
        "overcast": "пасмурно",
        "partly-cloudy-and-light-rain": "небольшой дождь",
        "partly-cloudy-and-rain": "дождь",
        "overcast-and-rain": "сильный дождь",
        "overcast-thunderstorms-with-rain": "сильный дождь, гроза",
        "cloudy-and-light-rain": "небольшой дождь",
        "overcast-and-light-rain": "небольшой дождь",
        "cloudy-and-rain": "дождь",
        "overcast-and-wet-snow": "дождь со снегом",
        "partly-cloudy-and-light-snow": "небольшой снег",
        "partly-cloudy-and-snow": "снег",
        "overcast-and-snow": "снегопад",
        "cloudy-and-light-snow": "небольшой снег",
        "overcast-and-light-snow": "небольшой снег",
        "cloudy-and-snow": "снег"
    ]
}

class Winds {
    private static let winds: [String: String] = [
        "nw": "СЗ",
        "n": "С",
        "ne": "СВ",
        "e": "В",
        "se": "ЮВ",
        "s": "Ю",
        "sw": "ЮЗ",
        "w": "З"
    ]
    
    private static let calm: [String: String] = ["с": "штиль"]
    
    static func getName(wind: String) -> String {
        return winds[wind] ?? calm[wind] ?? "N/A"
    }
    
    static func isWind(wind: String) -> Bool {
        return winds[wind] != nil
    }
}
