//
// Created by jamshed alam on 2019-07-04.
// Copyright (c) 2019 jamshed alam. All rights reserved.
//

import RxDataSources

struct ForecastSection {
    var items: [Item]
}

extension ForecastSection: SectionModelType {
    typealias Item = FoodOrderCellObject

    init(original: ForecastSection, items: [Item]) {
        self = original
        self.items = items
    }
}
