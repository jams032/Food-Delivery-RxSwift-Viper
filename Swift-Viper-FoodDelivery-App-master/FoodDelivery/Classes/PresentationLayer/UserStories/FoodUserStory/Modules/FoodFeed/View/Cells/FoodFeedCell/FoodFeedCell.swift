//
//  FoodFeedCell.swift
//  FoodDelivery
//
//  Created by jamshed alam on 25.08.17.
//  Copyright © 2017 jamshed alam. All rights reserved.
//

import UIKit

class FoodFeedCell: UITableViewCell {

    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var description1: UILabel!
    @IBOutlet weak var datelabel: UILabel!
    @IBOutlet weak var addCardtutton: UIButton!
    @IBOutlet weak var itemImageView: UIImageView!

    static var defaultHeight: CGFloat? {
        return 120
    }

    func configure(with cellObject: FoodFeedCellObject) {
//        textLabel?.text = cellObject.name
//        detailTextLabel?.text = cellObject.weather
        itemName?.text = cellObject.name
        description1?.text = cellObject.weather
        datelabel?.text = "10-10-2020"
        addCardtutton.titleLabel?.text = "\(cellObject.price))"
        itemImageView.image = UIImage.init(named: "image1")

    }
}
