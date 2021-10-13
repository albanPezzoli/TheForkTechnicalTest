//
//  RestaurantServiceDelegate.swift
//  TheForkTechnicalTest
//
//  Created by Alban on 13/10/2021.
//

import Foundation

protocol RestaurantServiceDelegate: AnyObject {
    func retrieveRestaurantDidSuccess(restaurants: [Restaurant])
    func retrieveRestaurantDidFailed(error: Error)
}
