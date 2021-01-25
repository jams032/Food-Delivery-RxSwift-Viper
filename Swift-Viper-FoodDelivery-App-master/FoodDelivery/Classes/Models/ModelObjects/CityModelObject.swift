//
// Created by jamshed alam on 27.08.17.
// Copyright (c) 2020 jamshed. All rights reserved.
//

import Foundation
import RealmSwift

class FoodModelObject: Object, RealmEntity {

    typealias EntityType = FoodModelObject

//    @objc dynamic var id = 0
//    @objc dynamic var name = ""
//    @objc dynamic var weather = ""
//    @objc dynamic var created = Date()

    @objc dynamic var Order_ID = 0
    @objc dynamic var Table_No = 0
    @objc dynamic var Crust = ""
    @objc dynamic var Flavor = ""
    @objc dynamic var Size = ""
    @objc dynamic var Timestamp = ""
    
    convenience required init(entity: EntityType) {
        self.init()
        
        self.Order_ID = entity.Order_ID
        self.Table_No = entity.Table_No
        self.Crust = entity.Crust
        self.Size = entity.Size
        self.Flavor = entity.Flavor
        self.Timestamp = entity.Timestamp

        
    }

    var plainObject: FoodModelObject {
        return FoodModelObject //(Order_ID: Order_ID,Table_No: Table_No, Crust: Crust, Size: Size,Timestamp:Timestamp)
    }

    override class func primaryKey() -> String? {
        return "Order_ID"
    }
}
