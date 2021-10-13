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
    private var restaurant: [Restaurant] = []
    
    weak var delegate: RestaurantServiceDelegate?
    
    init(restaurantListService: RestaurantListService = RestaurantListService()) {
        self.restaurantListService = restaurantListService
        self.restaurantListService.retriveListRestaurant{[weak self] result in
            switch result {
            case .success(let response):
                self?.restaurant = response.data
            case .failure(let error):
                break
            }
        }
    }
    
    func retrieveRestaurant() {
        delegate?.retrieveRestaurantDidSuccess(restaurants: restaurant)
    }
}
