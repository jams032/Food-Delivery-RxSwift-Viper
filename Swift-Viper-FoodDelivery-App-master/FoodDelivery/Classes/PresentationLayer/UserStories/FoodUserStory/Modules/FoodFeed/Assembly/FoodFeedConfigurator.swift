//
// Created by jamshed alam on 02.09.17.
// Copyright (c) 2020 jamshed. All rights reserved.
//

import Foundation
import Swinject

class FoodFeedConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? FoodFeedViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: FoodFeedViewController) {
        guard let container = ApplicationAssembly.assembler.resolver as? Container else {
            fatalError()
        }

        let router = FoodFeedRouter()
        router.transitionHandler = viewController

        let presenter = FoodFeedPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = FoodFeedInteractor()
        interactor.output = presenter
        interactor.timeoutService = container.resolve(TimeoutServiceType.self)
        interactor.foodFecade = container.resolve(FoodFecadeType.self)

        presenter.interactor = interactor
        viewController.output = presenter
    }
}
