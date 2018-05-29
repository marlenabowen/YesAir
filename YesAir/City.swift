//
//  Cities.swift
//  YesAir
//
//  Created by Marlena Bowen on 5/29/18.
//  Copyright © 2018 Marlena Bowen. All rights reserved.
//

import UIKit

enum CityFields: String {
    case Name = "city"
    case Count = "count"
}

var AllCities: [City] = []
    
class City {
    var name: String
    var count: Int
    
    required init(json: [String: Any]) {
        self.name = json[CityFields.Name.rawValue] as! String
        self.count = json[CityFields.Count.rawValue] as! Int
    }
    
    class func cityArray(results: NSArray) {
        for result in results {
            var city = result as! [String: AnyObject]
            if (city["count"] as! Int >= 10000) {
                city.removeValue(forKey: "locations")
                city.removeValue(forKey: "country")
                let newCity = City(json: city)
                AllCities.append(newCity)
            }
        }
    }
}
