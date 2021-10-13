//
//  MainCoordinator.swift
//  TheForkTechnicalTest
//
//  Created by Alban on 13/10/2021.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    private let restaurantsViewModel = RestaurantsViewModel()

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = ListViewController(restaurantsViewModel: restaurantsViewModel)
        viewController.coordinator = self
        
        navigationController.pushViewController(viewController, animated: false)
    }
}
