//
// Created by jamshed alam on 27.08.17.
// Copyright (c) 2020 jamshed. All rights reserved.
//

import Foundation

public struct OrderPlainObject {
    let name: String
    let time: Int
    let day: String
}

extension OrderPlainObject: Codable {

    enum OrderPlainObjectKeys: String, CodingKey {
        case name = "dt_txt"
        case time = "dt"
        case weather
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: OrderPlainObjectKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(time, forKey: .time)
        try container.encode(day, forKey: .weather)
    }

    // Decodable protocol methods

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: OrderPlainObjectKeys.self)
        name = try container.decode(String.self, forKey: .name)
        time = try container.decode(Int.self, forKey: .time)
        let weathers: [WeatherPlainObject] = try container.decode([WeatherPlainObject].self, forKey: .weather)
        day = weathers.first?.main ?? ""
    }
}
