//
//  RestaurantsViewModel.swift
//  TheForkTechnicalTest
//
//  Created by Alban on 13/10/2021.
//

import Foundation

final class RestaurantsViewModel {
    // Instanciate in the init, can be force unwrapped
    private let restaurantListService: RestaurantListService!
    private var restaurantResult: Result<ListRestaurant, Error>?
    private var restaurant: [RestaurantDTO] = []
    
    weak var delegate: RestaurantServiceDelegate?
    
    init(restaurantListService: RestaurantListService = RestaurantListService()) {
        self.restaurantListService = restaurantListService
        self.restaurantListService.retriveListRestaurant{[weak self] result in
            self?.restaurantResult = result
        }
    }

    func retrieveRestaurant() {
        guard let restaurantResult = restaurantResult else { return }
        switch restaurantResult {
        case .success(let response):
            self.restaurant = response.data.map { RestaurantDTO(restaurant: $0)}
            delegate?.retrieveRestaurantDidSuccess(restaurants: self.restaurant)
        case .failure(let error):
            delegate?.retrieveRestaurantDidFailed(error: error)
        }
    }
    
    func sortRestaurantByName() {
        let sortedArray = restaurant.sorted{ lhs, rhs -> Bool in
            return lhs.name.caseInsensitiveCompare(rhs.name) == .orderedAscending
        }
        delegate?.retrieveRestaurantDidSuccess(restaurants: sortedArray)
    }
    
    /// Sort restaurant by using only the theFork rating
    /// We could optimize this sort by balancing each rating (TheFork and Tripadvisor) with their reviews numbers
    func sortRestaurantByRank() {
        let sortedArray = restaurant.sorted { lhs, rhs -> Bool in
            return lhs.theForkRating > rhs.theForkRating
        }
        delegate?.retrieveRestaurantDidSuccess(restaurants: sortedArray)
    }
}
