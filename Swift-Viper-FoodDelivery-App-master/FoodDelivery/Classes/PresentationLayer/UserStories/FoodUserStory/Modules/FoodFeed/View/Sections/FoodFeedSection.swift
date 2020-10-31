//
// Created by jamshed alam on 2019-07-04.
// Copyright (c) 2019 jamshed alam. All rights reserved.
//

import RxDataSources

struct FoodFeedSection {
    var items: [Item]
}

extension FoodFeedSection: SectionModelType {
    typealias Item = FoodFeedCellObject

    init(original: FoodFeedSection, items: [Item]) {
        self = original
        self.items = items
    }
}
