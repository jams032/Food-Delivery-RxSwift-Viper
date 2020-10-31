//
// Created by jamshed alam on 27.08.17.
// Copyright (c) 2020 jamshed. All rights reserved.
//

import Foundation
import Moya
import RxSwift

public protocol FoodNetworkServiceType {

    func cities() -> Observable<[CityPlainObject]>

    func forecasts(_ city: CityPlainObject) -> Observable<[ForecastPlainObject]>

}

class FoodNetworkService: FoodNetworkServiceType {

    private static let cityIds = [
        6077243, 524901, 5368361, 1835848, 3128760, 4180439,
        2147714, 264371, 1816670, 2643743, 3451190, 1850147
    ]

//    let provider = MoyaProvider<OpenWeatherAPI>(plugins: [NetworkLoggerPlugin(verbose: true)])
    let provider = MoyaProvider<OpenFoodAPI>(plugins: [NetworkLoggerPlugin()])

    func cities() -> Observable<[CityPlainObject]> {
        return provider.rx.request(.cities(FoodNetworkService.cityIds))
                .debug()
                .filterSuccessfulStatusCodes()
                .asObservable()
                .map([CityPlainObject].self, atKeyPath: "list")
    }

    func forecasts(_ city: CityPlainObject) -> Observable<[ForecastPlainObject]> {
        return provider.rx.request(.forecast(city.id))
                .debug()
                .filterSuccessfulStatusCodes()
                .asObservable()
                .map([ForecastPlainObject].self, atKeyPath: "list")
    }

}
