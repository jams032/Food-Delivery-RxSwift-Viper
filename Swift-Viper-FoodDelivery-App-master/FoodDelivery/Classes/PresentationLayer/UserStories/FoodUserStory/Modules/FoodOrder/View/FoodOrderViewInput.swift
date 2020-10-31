//
//  FoodOrderFoodOrderViewInput.swift
//  FoodDelivery
//
//  Created by jamshed alam on 26/08/2020.
//  Copyright © 2017 jamshed alam. All rights reserved.
//

protocol FoodOrderViewInput: class {

    /**
        @author jamshed alam
        Setup initial state of the view
    */

    func setupInitialState(_ city: CityPlainObject)

    func configureWithItems(_ items: [ForecastPlainObject])
}
