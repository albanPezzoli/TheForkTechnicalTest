//
//  RestaurantServiceMock.swift
//  TheForkTechnicalTestTests
//
//  Created by Alban on 16/10/2021.
//

import Foundation

class RestaurantServiceMock: RestaurantServiceProtocol {
    func retriveListRestaurant(completionHandler: @escaping (Result<ListRestaurant, Error>) -> Void) {
        completionHandler(.success(MockedRestaurant.restaurants))
    }
}
