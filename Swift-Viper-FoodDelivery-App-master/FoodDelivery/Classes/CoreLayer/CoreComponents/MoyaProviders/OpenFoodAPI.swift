//
// Created by jamshed alam on 04.09.17.
// Copyright (c) 2020 jamshed. All rights reserved.
//

import Foundation
import Moya

// https://developer.edamam.com/admin
// https://order-pizza-api.herokuapp.com/api/ui/?ref=apilist.fun#!/Orders/orders_read_all
// https://order-pizza-api.herokuapp.com/api/orders

public enum OpenFoodAPI {
    static let apiKey = "" // ee4096f5d1aef5b2a6bd7b46209b75b7"
    case cities
    case forecast(Int)
}

extension OpenFoodAPI: TargetType {

    public var headers: [String: String]? {
        return nil
    }

    public var baseURL: URL {
        //assert(!OpenFoodAPI.apiKey.isEmpty)
        return URL(string: "https://order-pizza-api.herokuapp.com/api/orders")!
    }

    public var path: String {
        switch self {
        case .cities:
            return ""
        case .forecast:
            return "/forecast"
        }
    }

    public var method: Moya.Method {
        return .get
    }

    public var task: Task {
        switch self {
        case .cities:
            let params = [
                "": ""
            ]
           // return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
            return .requestPlain
        case .forecast(let cityId):
//            let params: [String: Any] = [
//                "id": cityId,
//                "APPID": OpenFoodAPI.apiKey
//            ]
            return .requestPlain // requestParameters(parameters: params, encoding: URLEncoding.queryString)
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
