//
//  FoodOrderFoodOrderModuleInput.swift
//  FoodDelivery
//
//  Created by jamshed alam on 26/08/2020.
//  Copyright © 2017 jamshed alam. All rights reserved.
//

import ViperMcFlurry

protocol FoodOrderModuleInput: class, RamblerViperModuleInput {

    func configure(with: CityPlainObject)

}
