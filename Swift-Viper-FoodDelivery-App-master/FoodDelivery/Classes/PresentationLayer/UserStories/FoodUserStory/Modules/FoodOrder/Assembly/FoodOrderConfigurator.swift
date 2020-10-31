//
// Created by jamshed alam on 02.09.17.
// Copyright (c) 2020 jamshed. All rights reserved.
//

import Foundation
import Swinject

class FoodOrderConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? FoodOrderViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: FoodOrderViewController) {
        guard let container = ApplicationAssembly.assembler.resolver as? Container else {
            fatalError()
        }

        let router = FoodOrderRouter()
        router.transitionHandler = viewController

        let presenter = FoodOrderPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = FoodOrderInteractor()
        interactor.output = presenter
        interactor.foodFecade = container.resolve(FoodFecadeType.self)

        presenter.interactor = interactor
        viewController.output = presenter
        viewController.moduleInput = presenter
    }
}
