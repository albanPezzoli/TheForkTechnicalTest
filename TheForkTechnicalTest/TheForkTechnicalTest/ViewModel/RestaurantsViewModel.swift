//
//  RestaurantsViewModel.swift
//  TheForkTechnicalTest
//
//  Created by Alban on 13/10/2021.
//

import Foundation

final class RestaurantsViewModel: RestaurantViewModelProtocol {
    // Instanciate in the init, can be force unwrapped
    private let restaurantListService: RestaurantServiceProtocol!
    private var restaurantResult: Result<ListRestaurant, Error>?
    private var restaurant: [RestaurantDTO] = []
    
    weak var delegate: RestaurantServiceDelegate?
    
    init(restaurantListService: RestaurantServiceProtocol) {
        self.restaurantListService = restaurantListService
    }

    func retrieveRestaurant() {
        self.restaurantListService.retriveListRestaurant{[weak self] result in
            switch result {
            case .success(let response):
                let restaurantDTO = response.data.map { RestaurantDTO(restaurant: $0)}
                self?.restaurant = restaurantDTO
                self?.delegate?.retrieveRestaurantDidSuccess(restaurants: restaurantDTO)
            case .failure(let error):
                self?.delegate?.retrieveRestaurantDidFailed(error: error)
            }
        }
    }
    
    func sortRestaurantByName() {
        let sortedArray = restaurant.sorted{ lhs, rhs -> Bool in
            return lhs.name.caseInsensitiveCompare(rhs.name) == .orderedAscending
        }
        delegate?.retrieveRestaurantDidSuccess(restaurants: sortedArray)
    }
    
    /// Sort restaurant by using only The Fork rating
    /// We could optimize this sort by balancing each rating (TheFork and Tripadvisor) with their reviews numbers
    func sortRestaurantByRank() {
        let sortedArray = restaurant.sorted { lhs, rhs -> Bool in
            return lhs.theForkRating > rhs.theForkRating
        }
        delegate?.retrieveRestaurantDidSuccess(restaurants: sortedArray)
    }
}
