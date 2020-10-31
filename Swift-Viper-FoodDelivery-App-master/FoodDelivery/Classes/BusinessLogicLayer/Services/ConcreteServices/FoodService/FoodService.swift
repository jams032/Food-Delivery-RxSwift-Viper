//
// Created by jamshed alam on 30.09.17.
// Copyright (c) 2020 jamshed. All rights reserved.
//

import Foundation

public protocol FoodServiceType {

    func filterCities(_ searchString: String, _ cities: [CityPlainObject]) -> [CityPlainObject]

}

class FoodService: FoodServiceType {
    func filterCities(_ searchString: String, _ cities: [CityPlainObject]) -> [CityPlainObject] {
        return cities.filter({ (city: CityPlainObject) -> Bool in
            return city.name.lowercased().range(of: searchString.lowercased()) != nil
        })
    }
}
