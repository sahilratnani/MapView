//
//  Location.swift
//  mapView
//
//  Created by Cyber - Sahil Ratnani on 15/06/19.
//  Copyright © 2019 Concerge. All rights reserved.
//

import Foundation

struct Location: Decodable {
    let lat: String
    let long: String
    let cityName: String
    
    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case long = "long"
        case cityName = "city_name"
    }
}
