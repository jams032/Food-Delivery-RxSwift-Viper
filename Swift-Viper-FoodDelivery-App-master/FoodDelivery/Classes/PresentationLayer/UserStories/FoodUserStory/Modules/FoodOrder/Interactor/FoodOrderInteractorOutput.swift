//
//  FoodOrderFoodOrderInteractorOutput.swift
//  FoodDelivery
//
//  Created by jamshed alam on 26/08/2020.
//  Copyright © 2017 jamshed alam. All rights reserved.
//

import Foundation

protocol FoodOrderInteractorOutput: class {

    func didObtainForecast(_ forecast: [ForecastPlainObject])
}
