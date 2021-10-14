//
//  RestaurantDTO.swift
//  TheForkTechnicalTest
//
//  Created by Alban on 13/10/2021.
//

import Foundation

struct RestaurantDTO {
    private let identifier: String
    let mainImageUrl: String?
    let theForkRating: String
    let name: String
    let address: String
    var isFavorite: Bool
    
    init(restaurant: Restaurant) {
        identifier = restaurant.uuid
        mainImageUrl = restaurant.mainPhoto?.source
        theForkRating = "\(restaurant.aggregateRatings.thefork.ratingValue)"
        name = restaurant.name
        address = "\(restaurant.address.street)\n\(restaurant.address.postalCode) \(restaurant.address.locality) \(restaurant.address.country)"
        isFavorite = UserDefaultValues.favoriteKeys.contains(restaurant.uuid)
    }
    
    mutating func updateFavorite() {
        if isFavorite {
            UserDefaultValues.favoriteKeys.removeAll(where: {$0 == identifier})
        } else {
            UserDefaultValues.favoriteKeys.append(identifier)
        }
        isFavorite = !isFavorite
    }
}
