//
// Created by jamshed alam on 30.09.17.
// Copyright (c) 2020 jamshed. All rights reserved.
//

import Foundation

public protocol FoodServiceType {

    func filterCities(_ searchString: String, _ cities: [FoodModelObject]) -> [FoodModelObject]

}

class FoodService: FoodServiceType {
    func filterCities(_ searchString: String, _ cities: [FoodModelObject]) -> [FoodModelObject] {
        return cities.filter({ (city: FoodModelObject) -> Bool in
            return city.Flavor.lowercased().range(of: searchString.lowercased()) != nil
        })
    }
}
