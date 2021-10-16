//
//  RestaurantServiceProtocol.swift
//  TheForkTechnicalTest
//
//  Created by Alban on 16/10/2021.
//

import Foundation

protocol RestaurantServiceProtocol {
    func retriveListRestaurant(completionHandler: @escaping (Result<ListRestaurant, Error>) -> Void)
}
