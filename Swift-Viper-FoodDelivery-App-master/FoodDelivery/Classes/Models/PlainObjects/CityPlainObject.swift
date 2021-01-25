//
// Created by jamshed alam on 26.08.17.
// Copyright (c) 2020 jamshed. All rights reserved.
//

import Foundation

public struct FoodPlainObject { // CityPlainObject

    let Order_ID: Int
    let Table_No: Int
    let Crust: String
    let Flavor: String
    let Size: String
    let Timestamp: String

    public init(Order_ID: Int,Table_No: Int, Crust: String, Size: String,Timestamp:String) {
        self.Order_ID = Order_ID
        self.Table_No = Table_No
        self.Crust = Crust
        self.Size = Size
        self.Timestamp = Timestamp

    }

}

extension FoodPlainObject: Codable {

    enum FoodPlainObjectKeys: String, CodingKey {
            case Order_ID
            case Table_No
            case Crust
            case Flavor
            case Size
            case Timestamp
    }

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: FoodPlainObjectKeys.self)

        try container.encode(Order_ID, forKey: .Order_ID)
        try container.encode(Table_No, forKey: .Table_No)
        try container.encode(Crust, forKey: .Crust)
        try container.encode(Flavor, forKey: .Flavor)
        try container.encode(Size, forKey: .Size)
        try container.encode(Timestamp, forKey: .Timestamp)
        
    }

    // Decodable protocol methods

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: FoodPlainObjectKeys.self)

        Order_ID = try container.decode(Int.self, forKey: .Order_ID)
        Table_No = try container.decode(Int.self, forKey: .Table_No)
        Crust = try container.decode(String.self, forKey: .Crust)
        Flavor = try container.decode(String.self, forKey: .Flavor)
        Size = try container.decode(String.self, forKey: .Size)
        Timestamp = try container.decode(String.self, forKey: .Timestamp)

    }

}

extension FoodPlainObject: Entity {

    typealias RealmEntityType = FoodModelObject

    var modelObject: FoodModelObject {
        return FoodModelObject(entity: self)
    }
}
