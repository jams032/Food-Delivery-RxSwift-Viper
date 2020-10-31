//
//  FoodDeliveryFeedFoodFeedRouter.swift
//  FoodDelivery
//
//  Created by jamshed alam on 24/08/2020.
//  Copyright © 2017 jamshed alam. All rights reserved.
//

import ViperMcFlurry

class FoodFeedRouter: FoodFeedRouterInput {
    weak var transitionHandler: RamblerViperModuleTransitionHandlerProtocol!

    let feedToDetailSegue = "feedToDetailSegue"

    func openForecastModule(_ city: CityPlainObject) {
        transitionHandler.openModule!(usingSegue: feedToDetailSegue).thenChain { input in
            guard let input = input as? FoodOrderModuleInput else {
                return nil
            }
            input.configure(with: city)
            return nil
        }
    }
}
