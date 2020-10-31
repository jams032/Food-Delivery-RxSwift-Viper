//
// Created by jamshed alam on 27.08.17.
// Copyright (c) 2020 jamshed. All rights reserved.
//

import Foundation
import Swinject

class ServiceComponentsAssembly: Assembly {

    func assemble(container: Container) {
        container.register(TimeoutServiceType.self) { _ in
            TimeoutService()
        }.inObjectScope(.transient)

        container.register(FoodServiceType.self) { _ in
            FoodService()
        }.inObjectScope(.transient)

        container.register(FoodNetworkServiceType.self) { _ in
            FoodNetworkService()
        }.inObjectScope(.transient)

        container.register(FoodRepositoryServiceType.self) { _ in
            FoodRepositoryService()
        }.inObjectScope(.transient)

        container.register(FoodFecadeType.self) { res in
            FoodFecade(foodService: res.resolve(FoodServiceType.self)!,
                    foodNetworkService: res.resolve(FoodNetworkServiceType.self)!,
                    foodRepositoryService: res.resolve(FoodRepositoryServiceType.self)!)
        }.inObjectScope(.transient)

    }
}
