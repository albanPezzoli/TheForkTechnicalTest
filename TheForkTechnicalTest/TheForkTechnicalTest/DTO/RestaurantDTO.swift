//
//  RestaurantDTO.swift
//  TheForkTechnicalTest
//
//  Created by Alban on 13/10/2021.
//

import Foundation

struct RestaurantDTO {
    let mainImageUrl: String?
    let theForkRating: String
    let name: String
    let address: String
    
    init(restaurant: Restaurant) {
        mainImageUrl = restaurant.mainPhoto?.source
        theForkRating = "\(restaurant.aggregateRatings.thefork.ratingValue)"
        name = restaurant.name
        address = "\(restaurant.address.street)\n\(restaurant.address.postalCode) \(restaurant.address.locality) \(restaurant.address.country)"
    }
}
