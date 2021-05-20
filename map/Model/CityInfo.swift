//
//  CityInfo.swift
//  map
//
//  Created by Adam Mabrouki on 20/05/2021.
//

import Foundation

// MARK: - CityInfo
struct CityInfo: Codable {
    let city: String
    let isOnline: Bool
    let distance: Int
    let locations: [Location]

    enum CodingKeys: String, CodingKey {
        case city
        case isOnline = "is_online"
        case distance, locations
    }
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let latitude, longitude: Double
}
