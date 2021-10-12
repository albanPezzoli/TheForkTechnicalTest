//
//  ViewController.swift
//  TheForkTechnicalTest
//
//  Created by Alban on 12/10/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        RestaurantListService().retriveListRestaurant { result in
            switch result {
            case .success(let response):
                print(response)
                break
            case .failure:
                break
            }
        }
    }
}

