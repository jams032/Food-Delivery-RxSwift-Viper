//
//  FoodDeliveryFeedFoodFeedViewInput.swift
//  FoodDelivery
//
//  Created by jamshed alam on 24/08/2020.
//  Copyright © 2017 jamshed alam. All rights reserved.
//

protocol FoodFeedViewInput: class {

    /**
        @author jamshed alam
        Setup initial state of the view
    */

    func setupInitialState()

    func configureWithItems(items: [FoodFeedCellObject])
}
