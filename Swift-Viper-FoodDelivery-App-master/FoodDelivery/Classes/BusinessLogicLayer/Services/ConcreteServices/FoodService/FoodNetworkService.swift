//
// Created by jamshed alam on 27.08.17.
// Copyright (c) 2020 jamshed. All rights reserved.
//

import Foundation
import Moya
import RxSwift

public protocol FoodNetworkServiceType {

    func cities() -> Observable<[FoodPlainObject]>

  //  func forecasts(_ city: FoodModelObject) -> Observable<[ForecastPlainObject]>

}

class FoodNetworkService: FoodNetworkServiceType {

//    private static let cityIds = [
//        6077243, 524901, 5368361, 1835848, 3128760, 4180439,
//        2147714, 264371, 1816670, 2643743, 3451190, 1850147
//    ]

    let provider = MoyaProvider<OpenFoodAPI>(plugins: [NetworkLoggerPlugin()])

    func cities() -> Observable<[FoodModelObject]> {
        return provider.rx.request(.cities)
        .debug()
        .filterSuccessfulStatusCodes()
        .asObservable()
            .map([FoodPlainObject].self)
        
        
     //   return  provider.rx.request(.cities).debug().filterSuccessfulStatusCodes()
//        .asObservable()
//        .mapJSON()
//        .map([Orders.self])
    }

//    func forecasts(_ city: FoodModelObject) -> Observable<[FoodModelObject]> {
//        return provider.rx.request(.forecast(city.Order_ID))
//                .debug()
//                .filterSuccessfulStatusCodes()
//                .asObservable()
//                .map([FoodModelObject].self, atKeyPath: "list")
//    }

}
