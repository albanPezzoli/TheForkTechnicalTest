//
//  ListViewController.swift
//  TheForkTechnicalTest
//
//  Created by Alban on 12/10/2021.
//

import UIKit

final class ListViewController: UIViewController {
    /* UI Components */
    private let collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 100)
        layout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        return collection
    }()
    
    private let activityIndicator = UIActivityIndicatorView(style: .gray)
    
    /* Variables */
    private var restaurants: [Restaurant] = []
    private var restaurantsViewModel: RestaurantsViewModel!
    weak var coordinator: MainCoordinator?
    
    private static let restaurantCellID = "RestaurantCellID"
    
    /* Functions */
    init(restaurantsViewModel: RestaurantsViewModel) {
        self.restaurantsViewModel = restaurantsViewModel

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "ListViewControllerTitle".localized
        self.view.backgroundColor = .white
        
        setupActivityIndicator()
        setupCollectionView()
        
        restaurantsViewModel.delegate = self
        
        
        restaurantsViewModel!.retrieveRestaurant()
    }
    
    private func setupActivityIndicator() {
        self.view.addSubview(activityIndicator)
        
        // Set the indicator on the center of the imageView
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true

        activityIndicator.startAnimating()
    }
    
    private func setupCollectionView() {
        self.view.addSubview(collectionView)
        
        collectionView.backgroundColor = .clear
        
        // Constrain tableView to the view
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Register cell
        collectionView.register(RestaurantCell.self, forCellWithReuseIdentifier: ListViewController.restaurantCellID)
        
        collectionView.isHidden = true
    }
}

extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListViewController.restaurantCellID, for: indexPath) as? RestaurantCell {
            cell.backgroundColor = .brown
            return cell
        }
        return UICollectionViewCell()
    }
}

extension ListViewController: RestaurantServiceDelegate {
    func retrieveRestaurantDidSuccess(restaurants: [Restaurant]) {
        Thread.onMainThread {
            self.restaurants = restaurants
            self.collectionView.reloadData()
            self.collectionView.isHidden = false
            self.activityIndicator.removeFromSuperview()
        }
    }
    
    func retrieveRestaurantDidFailed(error: Error) {
        Thread.onMainThread {
            self.presentPopupError(title: "errorTitle".localized, message: error.localizedDescription)
        }
    }
}
