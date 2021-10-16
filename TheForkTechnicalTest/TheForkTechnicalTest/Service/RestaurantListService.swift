//
//  RestaurantListService.swift
//  TheForkTechnicalTest
//
//  Created by Alban on 12/10/2021.
//

import Foundation

final class RestaurantListService: RestaurantServiceProtocol {
    
    private static let urlRestaurantList = "test.json"

    func retriveListRestaurant(completionHandler: @escaping (Result<ListRestaurant, Error>) -> Void) {
        BaseRequest.GET(from: Environment.baseURL + RestaurantListService.urlRestaurantList, completionHandler: { result in
            completionHandler(result)
        })
    }
}
