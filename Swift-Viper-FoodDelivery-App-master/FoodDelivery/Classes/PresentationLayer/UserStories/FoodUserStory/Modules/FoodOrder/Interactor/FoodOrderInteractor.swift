//
//  FoodOrderInteractor.swift
//  FoodDelivery
//
//  Created by jamshed alam on 26/08/2020.
//  Copyright © 2017 jamshed alam. All rights reserved.
//
import RxSwift

class FoodOrderInteractor: FoodOrderInteractorInput {

    weak var output: FoodOrderInteractorOutput!
    var foodFecade: FoodFecadeType!

    let disposeBag = DisposeBag()

    // MARK: - FoodOrderInteractorInput

    func obtainForecast(_ city: FoodModelObject) {
        foodFecade.forecasts(city)
                .observeOn(MainScheduler.instance)
                .subscribe(onNext: { [weak self] forecast in
                    self?.output.didObtainForecast(forecast)
                })
                .disposed(by: disposeBag)
    }
}
