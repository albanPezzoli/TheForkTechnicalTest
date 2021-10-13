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
}
