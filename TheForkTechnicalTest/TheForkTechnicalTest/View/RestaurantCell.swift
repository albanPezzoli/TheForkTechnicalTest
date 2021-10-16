//
//  RestaurantCell.swift
//  TheForkTechnicalTest
//
//  Created by Alban on 13/10/2021.
//

import UIKit

final class RestaurantCell: UICollectionViewCell {
    // MARK: UIComponents
    private let restaurantNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
    private let restaurantImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let theForkRatingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "tf-logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let theForkRatingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .green
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    private let theForkReviewNumbersLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    private let restaurantAddressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let favoriteImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "empty-heart")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let tripadvisorRatingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "ta-logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let tripadvisorRankView: RankView = {
        let rankView = RankView()
        rankView.translatesAutoresizingMaskIntoConstraints = false
        return rankView
    }()
    
    private let tripadvisorReviewNumbersLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    // MARK: Variables
    private var restaurant: RestaurantDTO?
    
    // MARK: Functions
    override func prepareForReuse() {
        super.prepareForReuse()
        
        restaurantImageView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 10
        self.backgroundColor = .white
        
        setupConstraints()
        
        let tapFavorite = UITapGestureRecognizer(target: self, action: #selector(handleFavorite))
        favoriteImageView.addGestureRecognizer(tapFavorite)
    }
    
    ///Will never be used
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        // Add subviews
        self.addSubview(restaurantNameLabel)
        self.addSubview(favoriteImageView)
        self.addSubview(restaurantImageView)
        self.addSubview(theForkRatingImageView)
        self.addSubview(theForkRatingLabel)
        self.addSubview(theForkReviewNumbersLabel)
        self.addSubview(restaurantAddressLabel)
        self.addSubview(tripadvisorRatingImageView)
        self.addSubview(tripadvisorRankView)
        self.addSubview(tripadvisorReviewNumbersLabel)
        
        // Constraint restaurant Image
        restaurantImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        restaurantImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        restaurantImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        restaurantImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        restaurantImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15).isActive = true
        
        // Constraint restaurant Name
        restaurantNameLabel.topAnchor.constraint(equalTo: restaurantImageView.topAnchor).isActive = true
        restaurantNameLabel.leadingAnchor.constraint(equalTo: restaurantImageView.trailingAnchor, constant: 20).isActive = true
        
        // Constraint favorite image
        favoriteImageView.centerYAnchor.constraint(equalTo: restaurantNameLabel.centerYAnchor).isActive = true
        favoriteImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        favoriteImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        favoriteImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        
        restaurantNameLabel.trailingAnchor.constraint(equalTo: favoriteImageView.leadingAnchor, constant: -10).isActive = true
        
        // Constraint the fork rating
        theForkRatingImageView.leadingAnchor.constraint(equalTo: restaurantImageView.trailingAnchor, constant: 20).isActive = true
        theForkRatingImageView.topAnchor.constraint(equalTo: restaurantNameLabel.bottomAnchor, constant: 5).isActive = true
        theForkRatingImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        theForkRatingImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        
        theForkRatingLabel.leadingAnchor.constraint(equalTo: theForkRatingImageView.trailingAnchor, constant: 5).isActive = true
        theForkRatingLabel.centerYAnchor.constraint(equalTo: theForkRatingImageView.centerYAnchor).isActive = true
        
        // Constraint the fork review
        theForkReviewNumbersLabel.centerYAnchor.constraint(equalTo: theForkRatingLabel.centerYAnchor).isActive = true
        theForkReviewNumbersLabel.leadingAnchor.constraint(equalTo: theForkRatingLabel.trailingAnchor, constant: 5).isActive = true
        theForkReviewNumbersLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        
        // Constraint the tripadvisor rating
        tripadvisorRatingImageView.leadingAnchor.constraint(equalTo: restaurantImageView.trailingAnchor, constant: 20).isActive = true
        tripadvisorRatingImageView.topAnchor.constraint(equalTo: theForkRatingImageView.bottomAnchor, constant: 5).isActive = true
        tripadvisorRatingImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        tripadvisorRatingImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        
        // Constraint tripadvisor rating
        tripadvisorRankView.leadingAnchor.constraint(equalTo: tripadvisorRatingImageView.trailingAnchor, constant: 5).isActive = true
        tripadvisorRankView.centerYAnchor.constraint(equalTo: tripadvisorRatingImageView.centerYAnchor).isActive = true
        
        // Constraint tripadvisor review
        tripadvisorReviewNumbersLabel.centerYAnchor.constraint(equalTo: tripadvisorRankView.centerYAnchor).isActive = true
        tripadvisorReviewNumbersLabel.leadingAnchor.constraint(equalTo: tripadvisorRankView.trailingAnchor, constant: 5).isActive = true
        tripadvisorReviewNumbersLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        
        // Constraint address label
        restaurantAddressLabel.leadingAnchor.constraint(equalTo: restaurantImageView.trailingAnchor, constant: 20).isActive = true
        restaurantAddressLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        restaurantAddressLabel.topAnchor.constraint(equalTo: tripadvisorRankView.bottomAnchor, constant: 10).isActive = true
        restaurantAddressLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15).isActive = true
    }
    
    public func setupCell(restaurant: RestaurantDTO) {
        self.restaurant = restaurant

        restaurantNameLabel.text = restaurant.name
        restaurantImageView.downloadImage(from: restaurant.mainImageUrl.orEmpty)
        theForkRatingLabel.text = "\(restaurant.theForkRating)"
        restaurantAddressLabel.text = restaurant.address
        favoriteImageView.image = restaurant.isFavorite ? #imageLiteral(resourceName: "filled-heart") : #imageLiteral(resourceName: "empty-heart")
        tripadvisorRankView.setRankValue(value: restaurant.tripadvisorRating)
        tripadvisorReviewNumbersLabel.text = "\(restaurant.tripadvisorReviewNumbers) reviews"
        theForkReviewNumbersLabel.text = "\(restaurant.theForkReviewNumbers) reviews"
    }
    
    /* Actions */
    @objc private func handleFavorite() {
        if let restaurant = restaurant {
            // Swap images
            favoriteImageView.image = restaurant.isFavorite ? #imageLiteral(resourceName: "empty-heart") : #imageLiteral(resourceName: "filled-heart")
            self.restaurant?.updateFavorite()
        }
    }
}
