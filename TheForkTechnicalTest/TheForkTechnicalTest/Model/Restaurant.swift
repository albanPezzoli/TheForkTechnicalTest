//
//  Restaurant.swift
//  TheForkTechnicalTest
//
//  Created by Alban on 12/10/2021.
//

import Foundation

struct ListRestaurant: Decodable {
    let data: [Restaurant]
}

struct Restaurant: Decodable {
    let name: String
    let uuid: String
    let servesCuisine: String
    let priceRange: Int
    let currenciesAccepted: String
    let address: Address
    let aggregateRatings: AggregateRating
    let mainPhoto: PhotoDimensions?
    let bestOffer: Offer
}

struct Address: Decodable {
    let street: String
    let postalCode: String
    let locality: String
    let country: String
}

struct AggregateRating: Decodable {
    let thefork: Rating
    let tripadvisor: Rating
}

struct Rating: Decodable {
    let ratingValue: Double
    let reviewCount: Int
}

struct PhotoDimensions: Decodable {
    let source: String
    let w612h344: String
    let w480h270: String
    let w240h135: String
    let w664h374: String
    let w1350h759: String
    let w160h120: String
    let w80h60: String
    let w92h92: String
    let w184h184: String
    enum CodingKeys: String, CodingKey {
        case source
        case w612h344 = "612x344"
        case w480h270 = "480x270"
        case w240h135 = "240x135"
        case w664h374 = "664x374"
        case w1350h759 = "1350x759"
        case w160h120 = "160x120"
        case w80h60 = "80x60"
        case w92h92 = "92x92"
        case w184h184 = "184x184"
    }
}

struct Offer: Decodable {
    let name: String
    let label: String
}
