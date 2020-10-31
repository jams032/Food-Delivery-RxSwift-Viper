//
// Created by jamshed alam on 02.09.17.
// Copyright (c) 2020 jamshed. All rights reserved.
//

import Foundation

class FoodOrderInitializer: NSObject {

    //Connect with object on storyboard

    @IBOutlet weak var foodOrderViewController: FoodOrderViewController!

    override func awakeFromNib() {

        let configurator = FoodOrderConfigurator()
        configurator.configureModuleForViewInput(viewInput: foodOrderViewController)
    }

}
