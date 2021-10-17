//
//  RestaurantDTO.swift
//  TheForkTechnicalTest
//
//  Created by Alban on 13/10/2021.
//

import Foundation

struct RestaurantDTO {
    let identifier: String
    let mainImageUrl: String?
    let theForkRating: Double
    let theForkReviewNumbers: Int
    let tripadvisorRating: Double
    let tripadvisorReviewNumbers: Int
    let name: String
    let address: String
    
    init(restaurant: Restaurant) {
        identifier = restaurant.uuid
        mainImageUrl = restaurant.mainPhoto?.w184h184

        theForkRating = restaurant.aggregateRatings.thefork.ratingValue
        theForkReviewNumbers = restaurant.aggregateRatings.thefork.reviewCount
        tripadvisorRating = restaurant.aggregateRatings.tripadvisor.ratingValue
        tripadvisorReviewNumbers = restaurant.aggregateRatings.tripadvisor.reviewCount

        name = restaurant.name
        address = "\(restaurant.address.street)\n\(restaurant.address.postalCode) \(restaurant.address.locality) \(restaurant.address.country)"
    }
}
