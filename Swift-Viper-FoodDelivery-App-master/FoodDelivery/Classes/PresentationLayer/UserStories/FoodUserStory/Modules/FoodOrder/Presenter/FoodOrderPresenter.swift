//
//  FoodOrderPresenter.swift
//  FoodDelivery
//
//  Created by jamshed alam on 26/08/2020.
//  Copyright © 2017 jamshed alam. All rights reserved.
//

import Foundation
import ViperMcFlurry

class FoodOrderPresenter: NSObject, FoodOrderModuleInput, FoodOrderViewOutput,
        FoodOrderInteractorOutput {

    weak var view: FoodOrderViewInput!
    var interactor: FoodOrderInteractorInput!
    var router: FoodOrderRouterInput!
    weak var moduleOutput: FoodOrderModuleOutput?

    var city: CityPlainObject!

    // MARK: - FoodOrderModuleInput

    func configure(with city: CityPlainObject) {
        self.city = city
    }

    // MARK: - FoodOrderViewOutput

    func viewIsReady() {
        view.setupInitialState(city)
        interactor.obtainForecast(city)
    }

    func didTriggerPullToRefresh() {
        interactor.obtainForecast(city)
    }

    // MARK: - FoodOrderInteractorOutput

    func didObtainForecast(_ forecast: [ForecastPlainObject]) {
        view.configureWithItems(forecast)
    }
}

extension FoodOrderPresenter {
    func setModuleOutput(_ moduleOutput: RamblerViperModuleOutput!) {
        self.moduleOutput = moduleOutput as? FoodOrderModuleOutput
    }
}
