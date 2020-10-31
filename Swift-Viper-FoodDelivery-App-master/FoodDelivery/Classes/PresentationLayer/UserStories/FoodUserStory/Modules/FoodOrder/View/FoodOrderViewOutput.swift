//
//  FoodOrderFoodOrderViewOutput.swift
//  FoodDelivery
//
//  Created by jamshed alam on 26/08/2020.
//  Copyright © 2017 jamshed alam. All rights reserved.
//

protocol FoodOrderViewOutput: PullToRefreshProtocol {

    /**
        @author jamshed alam
        Notify presenter that view is ready
    */

    func viewIsReady()
}
