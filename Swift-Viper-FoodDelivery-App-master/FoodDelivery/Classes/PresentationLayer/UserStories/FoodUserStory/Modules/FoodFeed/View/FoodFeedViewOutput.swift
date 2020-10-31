//
//  FoodDeliveryFeedFoodFeedViewOutput.swift
//  FoodDelivery
//
//  Created by jamshed alam on 24/08/2020.
//  Copyright © 2017 jamshed alam. All rights reserved.
//

protocol FoodFeedViewOutput: PullToRefreshProtocol {

    /**
        @author jamshed alam
        Notify presenter that view is ready
    */

    func viewIsReady()
    func didTriggerViewWillAppear()
    func didTriggerViewWillDisappear()

    func didTriggerSearchEvent(_ searchString: String)

    func didTapCity(_ city: CityPlainObject)
}
