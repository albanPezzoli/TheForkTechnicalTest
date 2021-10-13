//
//  Coordinator.swift
//  TheForkTechnicalTest
//
//  Created by Alban on 13/10/2021.
//

import UIKit

/// Coordinator interface
protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
