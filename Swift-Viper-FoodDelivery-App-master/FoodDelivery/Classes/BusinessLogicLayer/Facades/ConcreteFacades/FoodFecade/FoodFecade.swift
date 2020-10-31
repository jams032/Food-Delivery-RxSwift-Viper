//
// Created by jamshed alam on 30.09.17.
// Copyright (c) 2020 jamshed. All rights reserved.
//

import Foundation
import RxSwift

public protocol FoodFecadeType {

    func cities() -> Observable<[CityPlainObject]>

    func forecasts(_ city: CityPlainObject) -> Observable<[ForecastPlainObject]>

    func filterCities(_ searchString: String, _ cities: [CityPlainObject]) -> [CityPlainObject]
}

class FoodFecade: FoodFecadeType {

    private let foodService: FoodServiceType
    private let foodNetworkService: FoodNetworkServiceType
    private let foodRepositoryService: FoodRepositoryServiceType

    // MARK: - Init

    init(foodService: FoodServiceType,
         foodNetworkService: FoodNetworkServiceType,
         foodRepositoryService: FoodRepositoryServiceType) {
        self.foodService = foodService
        self.foodNetworkService = foodNetworkService
        self.foodRepositoryService = foodRepositoryService
    }

    func cities() -> Observable<[CityPlainObject]> {
        let networkCities = foodNetworkService.cities()
                .flatMap(foodRepositoryService.saveCities)

        return foodRepositoryService.cities()
                .flatMap { cities -> Observable<[CityPlainObject]> in
                    guard !cities.isEmpty else {
                        return networkCities
                    }
                    return Observable.just(cities)
                }
    }

    func forecasts(_ city: CityPlainObject) -> Observable<[ForecastPlainObject]> {
        return foodNetworkService.forecasts(city)
    }

    func filterCities(_ searchString: String, _ cities: [CityPlainObject]) -> [CityPlainObject] {
        return foodService.filterCities(searchString, cities)
    }
}
