//
// Created by jamshed alam on 04.09.17.
// Copyright (c) 2020 jamshed. All rights reserved.
//

import Foundation
import Moya

public enum OpenFoodAPI {
    static let apiKey = "ee4096f5d1aef5b2a6bd7b46209b75b7"
    case cities([Int])
    case forecast(Int)
}

extension OpenFoodAPI: TargetType {

    public var headers: [String: String]? {
        return nil
    }

    public var baseURL: URL {
        assert(!OpenFoodAPI.apiKey.isEmpty)
        return URL(string: "http://api.openweathermap.org/data/2.5")!
    }

    public var path: String {
        switch self {
        case .cities:
            return "/group"
        case .forecast:
            return "/forecast"
        }
    }

    public var method: Moya.Method {
        return .get
    }

    public var task: Task {
        switch self {
        case .cities(let cityIds):
            let params = [
                "APPID": OpenFoodAPI.apiKey,
                "id": cityIds.map {
                    String($0)
                }.joined(separator: ",")
            ]
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        case .forecast(let cityId):
            let params: [String: Any] = [
                "id": cityId,
                "APPID": OpenFoodAPI.apiKey
            ]
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        }
    }

    public var validate: Bool {
        return false
    }
    public var sampleData: Data {
        switch self {
        case .cities:
            return "Half measures are as bad as nothing at all.".data(using: String.Encoding.utf8)!
        case .forecast(let cityId):
            return "{\"login\": \"\(cityId)\", \"id\": 100}".data(using: String.Encoding.utf8)!
        }
    }
}
