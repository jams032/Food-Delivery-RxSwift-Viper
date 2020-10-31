//
//  FoodDeliveryFeedFoodFeedInteractorOutput.swift
//  FoodDelivery
//
//  Created by jamshed alam on 24/08/2020.
//  Copyright © 2017 jamshed alam. All rights reserved.
//

import Foundation

protocol FoodFeedInteractorOutput: class {
    func didTriggerTimerOutput()

    func didObtainCities(_ cities: [CityPlainObject])
}
