//
//  FoodDeliveryFeedFoodFeedInteractor.swift
//  FoodDelivery
//
//  Created by jamshed alam on 24/08/2020.
//  Copyright © 2017 jamshed alam. All rights reserved.
//
import RxSwift

class FoodFeedInteractor: FoodFeedInteractorInput, TimeoutServiceOutput {

    weak var output: FoodFeedInteractorOutput!

    var timeoutService: TimeoutServiceType!
    var foodFecade: FoodFecadeType!
    let disposeBag = DisposeBag()

    // MARK: - FoodFeedInteractorInput
    func startTimer() {
        timeoutService.startTimer(self)
    }

    func stopTimer() {
        timeoutService.stopTimer()
    }

    func obtainCities() {
        foodFecade.cities()
                .observeOn(MainScheduler.instance)
                .subscribe(onNext: { [weak self] cities in
                    self?.output.didObtainCities(cities)
                })
                .disposed(by: disposeBag)
    }

    func filterCities(_ searchString: String, _ cities: [FoodPlainObject]) -> [FoodPlainObject] {
        return foodFecade.filterCities(searchString, cities)
    }

    // MARK: - TimeoutServiceOutput
    func didTriggerTimer() {
        output.didTriggerTimerOutput()
    }
}
