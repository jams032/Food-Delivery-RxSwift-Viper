//
//  FoodDeliveryFeedFoodFeedInteractorInput.swift
//  FoodDelivery
//
//  Created by jamshed alam on 24/08/2020.
//  Copyright © 2017 jamshed alam. All rights reserved.
//

import Foundation

protocol FoodFeedInteractorInput {

    func obtainCities()

    func filterCities(_ searchString: String, _ cities: [FoodPlainObject]) -> [FoodPlainObject]

    func startTimer()

    func stopTimer()
}
