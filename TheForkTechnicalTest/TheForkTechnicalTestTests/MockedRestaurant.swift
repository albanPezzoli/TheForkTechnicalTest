//
//  MockedRestaurant.swift
//  TheForkTechnicalTestTests
//
//  Created by Alban on 16/10/2021.
//

import Foundation

struct MockedRestaurant {
    static let list = ListRestaurant(data: [
        Restaurant(name: "A", uuid: "12345", servesCuisine: "French", priceRange: 10, currenciesAccepted: "EUR", address: Address(street: "12 rue de la liberté", postalCode: "67000", locality: "Strasbourg", country: "France"), aggregateRatings: AggregateRating(thefork: Rating(ratingValue: 9.9, reviewCount: 1200), tripadvisor: Rating(ratingValue: 4.5, reviewCount: 100)), mainPhoto: nil, bestOffer: Offer(name: "reduction", label: "-40% sur les plats"))
    ])
}

class RestaurantServiceMock: RestaurantServiceProtocol {
    func retriveListRestaurant(completionHandler: @escaping (Result<ListRestaurant, Error>) -> Void) {
        completionHandler(.success(MockedRestaurant.list))
    }
}
