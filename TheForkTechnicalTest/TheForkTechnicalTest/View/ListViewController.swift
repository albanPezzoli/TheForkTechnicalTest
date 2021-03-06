//
//  ListViewController.swift
//  TheForkTechnicalTest
//
//  Created by Alban on 12/10/2021.
//

import UIKit

final class ListViewController: UIViewController {
    // MARK: UIComponents
    private let collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let cellWidth = UIApplication.shared.statusBarOrientation.isLandscape ?
            UIScreen.main.bounds.height : UIScreen.main.bounds.width
        layout.sectionInset = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
        layout.itemSize = CGSize(width: cellWidth - 30, height: 150)
        layout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        return collection
    }()
    
    private let activityIndicator = UIActivityIndicatorView(style: .gray)
    
    // MARK: Variables
    private var restaurants: [RestaurantDTO] = []
    private var restaurantsViewModel: RestaurantViewModelProtocol
    weak var coordinator: MainCoordinator?
    
    private static let restaurantCellID = "RestaurantCellID"
    
    // MARK: Functions
    init(restaurantsViewModel: RestaurantViewModelProtocol) {
        self.restaurantsViewModel = restaurantsViewModel

        super.init(nibName: nil, bundle: nil)
    }
    
    ///Will never be used
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "ListViewControllerTitle".localized
        self.view.backgroundColor = .lightBackground | .darkBackground
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "sortActionButton".localized,
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(showSortActionSheet))
        
        setupActivityIndicator()
        setupCollectionView()
        
        (restaurantsViewModel as?  RestaurantsViewModel)?.delegate = self

        restaurantsViewModel.retrieveRestaurant()
    }
    
    private func setupActivityIndicator() {
        self.view.addSubview(activityIndicator)
        
        // Set the indicator on the center of the imageView
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        activityIndicator.hidesWhenStopped = true

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
    
    /* Actions */
    @objc private func showSortActionSheet() {
        let alert = UIAlertController(title:nil , message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "sortByRankOption".localized, style: .default , handler:{ (UIAlertAction)in
            self.restaurantsViewModel.sortRestaurantByRank()
        }))
        
        alert.addAction(UIAlertAction(title: "sortByNameOption".localized, style: .default , handler:{ (UIAlertAction)in
            self.restaurantsViewModel.sortRestaurantByName()
        }))
        
        alert.addAction(UIAlertAction(title: "dismissOption".localized, style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: UICollectionViewDelegate, UICollectionViewDataSource
extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListViewController.restaurantCellID, for: indexPath) as? RestaurantCell {
            cell.setupCell(restaurant: self.restaurants[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let restauranCell = cell as? RestaurantCell {
            restauranCell.cancelImageRequestIfNeeded()
        }
    }
}

// MARK: RestaurantServiceDelegate
extension ListViewController: RestaurantServiceDelegate {
    func retrieveRestaurantDidSuccess(restaurants: [RestaurantDTO]) {
        Thread.onMainThread {
            self.restaurants = restaurants
            self.collectionView.reloadData()
            self.collectionView.setContentOffset(.zero, animated: false)
            self.collectionView.isHidden = false
            self.activityIndicator.stopAnimating()
        }
    }
    
    func retrieveRestaurantDidFailed(error: Error) {
        Thread.onMainThread {
            self.presentPopupError(title: "errorTitle".localized, message: error.localizedDescription)
        }
    }
}
