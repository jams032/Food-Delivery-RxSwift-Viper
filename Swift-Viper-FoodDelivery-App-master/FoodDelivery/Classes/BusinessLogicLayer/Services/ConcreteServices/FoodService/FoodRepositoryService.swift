//
// Created by jamshed alam on 27.08.17.
// Copyright (c) 2020 jamshed. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift

public protocol FoodRepositoryServiceType {

    func cities() -> Observable<[FoodModelObject]>

    func saveCities(_ cities: [FoodModelObject]) -> Observable<[FoodModelObject]>
}

class FoodRepositoryService: FoodRepositoryServiceType {

    func cities() -> Observable<[FoodModelObject]> {
        guard let repository = try? RealmRepository<FoodModelObject>() else {
            return Observable.error(RealmRepositoryError.createError)
        }
        return repository.fetchAll()
    }

    func saveCities(_ cities: [FoodModelObject]) -> Observable<[FoodModelObject]> {
        guard let repository = try? RealmRepository<FoodModelObject>() else {
            return Observable.error(RealmRepositoryError.createError)
        }
        return repository.save(items: cities)
                .map { cities }
    }
}
