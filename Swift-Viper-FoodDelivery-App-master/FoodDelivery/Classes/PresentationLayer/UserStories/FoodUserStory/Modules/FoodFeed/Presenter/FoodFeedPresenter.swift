//
//  FoodDeliveryFeedFoodFeedPresenter.swift
//  FoodDelivery
//
//  Created by jamshed alam on 24/08/2020.
//  Copyright © 2017 jamshed alam. All rights reserved.
//

class FoodFeedPresenter: FoodFeedModuleInput, FoodFeedViewOutput, FoodFeedInteractorOutput {

    weak var view: FoodFeedViewInput!
    var interactor: FoodFeedInteractorInput!
    var router: FoodFeedRouterInput!
    var cities: [CityPlainObject]!

    // MARK: - FoodFeedViewOutput

    func viewIsReady() {
        view.setupInitialState()
        interactor.obtainCities()
    }

    func didTriggerViewWillAppear() {
        interactor.startTimer()
    }

    func didTriggerViewWillDisappear() {
        interactor.stopTimer()
    }

    func didTriggerPullToRefresh() {
        interactor.obtainCities()
    }

    func didTriggerSearchEvent(_ searchString: String) {
        var cities = self.cities
        if !searchString.isEmpty {
            cities = interactor.filterCities(searchString, cities!)
        }
        view.configureWithItems(items: buildItems(cities!))
    }

    func didTapCity(_ city: CityPlainObject) {
       // router.openForecastModule(city)
    }

    // MARK: - FoodFeedInteractorOutput

    func didTriggerTimerOutput() {
        interactor.obtainCities()
    }

    func didObtainCities(_ cities: [CityPlainObject]) {
        self.cities = cities
        view.configureWithItems(items: buildItems(cities))
    }

    // MARK: - Private Methods

    func buildItems(_ cities: [CityPlainObject]) -> [FoodFeedCellObject] {
        var myArray = [FoodFeedCellObject]()
        cities.forEach { (city) in
            myArray.append(FoodFeedCellObject(id: city.id, name: city.name, weather: city.weather, city: city))
        }
        return myArray
    }
}
