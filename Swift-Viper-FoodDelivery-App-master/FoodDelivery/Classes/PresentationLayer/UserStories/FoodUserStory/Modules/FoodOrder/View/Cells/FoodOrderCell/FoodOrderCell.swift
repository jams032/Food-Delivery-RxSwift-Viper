//
// Created by jamshed alam on 27.08.17.
// Copyright (c) 2020 jamshed. All rights reserved.
//

import UIKit

class FoodOrderCell: UITableViewCell {

    static var defaultHeight: CGFloat? {
        return 44
    }

    func configure(with cellObject: FoodOrderCellObject) {
        textLabel!.text = cellObject.name
        detailTextLabel!.text = cellObject.weather
    }
}
