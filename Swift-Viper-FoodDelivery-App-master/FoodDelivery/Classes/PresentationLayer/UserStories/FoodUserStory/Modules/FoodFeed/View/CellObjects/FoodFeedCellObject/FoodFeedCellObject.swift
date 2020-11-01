//
// Created by jamshed alam on 25.08.17.
// Copyright (c) 2020 jamshed. All rights reserved.
//

import Foundation

struct FoodFeedCellObject {
    let id: Int
    let name: String
    let weather: String
    let price = 10 + arc4random()%100
    let city: CityPlainObject
}
