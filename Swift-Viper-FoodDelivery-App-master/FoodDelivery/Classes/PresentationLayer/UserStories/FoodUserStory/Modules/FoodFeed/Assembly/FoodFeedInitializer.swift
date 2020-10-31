//
// Created by jamshed alam on 02.09.17.
// Copyright (c) 2020 jamshed. All rights reserved.
//

import Foundation

class FoodFeedInitializer: NSObject {

    //Connect with object on storyboard

    @IBOutlet weak var foodFeedViewController: FoodFeedViewController!

    override func awakeFromNib() {

        let configurator = FoodFeedConfigurator()
        configurator.configureModuleForViewInput(viewInput: foodFeedViewController)
    }

}
