//
//  MockedRestaurant.swift
//  TheForkTechnicalTestTests
//
//  Created by Alban on 16/10/2021.
//

import Foundation

struct MockedRestaurant {
    static let restaurants = ListRestaurant(data: [
        Restaurant(name: "C",
                   uuid: "12345",
                   servesCuisine: "French",
                   priceRange: 10,
                   currenciesAccepted: "EUR",
                   address: Address(street: "13 rue de la liberté",
                                    postalCode: "67000",
                                    locality: "Strasbourg",
                                    country: "France"),
                   aggregateRatings: AggregateRating(thefork: Rating(ratingValue: 9.5, reviewCount: 1200),
                                                     tripadvisor: Rating(ratingValue: 4.5, reviewCount: 100)),
                   mainPhoto: nil,
                   bestOffer: Offer(name: "reduction", label: "-40% sur les plats")),
        Restaurant(name: "B",
                   uuid: "23456",
                   servesCuisine: "French",
                   priceRange: 10,
                   currenciesAccepted: "EUR",
                   address: Address(street: "14 rue de la liberté",
                                    postalCode: "67000",
                                    locality: "Strasbourg",
                                    country: "France"),
                   aggregateRatings: AggregateRating(thefork: Rating(ratingValue: 9.9, reviewCount: 1200),
                                                     tripadvisor: Rating(ratingValue: 4.5, reviewCount: 100)),
                   mainPhoto: nil,
                   bestOffer: Offer(name: "reduction", label: "-40% sur les plats")),
        Restaurant(name: "A",
                   uuid: "34567",
                   servesCuisine: "French",
                   priceRange: 10,
                   currenciesAccepted: "EUR",
                   address: Address(street: "15 rue de la liberté",
                                    postalCode: "67000",
                                    locality: "Strasbourg",
                                    country: "France"),
                   aggregateRatings: AggregateRating(thefork: Rating(ratingValue: 10, reviewCount: 1200),
                                                     tripadvisor: Rating(ratingValue: 4.5, reviewCount: 100)),
                   mainPhoto: nil,
                   bestOffer: Offer(name: "reduction", label: "-40% sur les plats")),
    ])
}
