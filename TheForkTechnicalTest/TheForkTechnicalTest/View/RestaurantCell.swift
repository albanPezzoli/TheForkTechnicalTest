//
//  RestaurantCell.swift
//  TheForkTechnicalTest
//
//  Created by Alban on 13/10/2021.
//

import UIKit

final class RestaurantCell: UICollectionViewCell {
    
    private let restaurantNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let restaurantImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let theForkRatingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "tf-logo")
        imageView.clipsToBounds = true
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .clear
        
        // Add subviews
        self.addSubview(restaurantNameLabel)
        self.addSubview(restaurantImageView)
        self.addSubview(theForkRatingImageView)
        self.addSubview(theForkRatingLabel)
        
        // Constraint restaurant Image
        restaurantImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        restaurantImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        restaurantImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        restaurantImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        restaurantImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15).isActive = true
        
        // Constraint restaurant Name
        restaurantNameLabel.topAnchor.constraint(equalTo: restaurantImageView.topAnchor).isActive = true
        restaurantNameLabel.leadingAnchor.constraint(equalTo: restaurantImageView.trailingAnchor, constant: 20).isActive = true
        restaurantNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        
        // Constraint the fork rating
        theForkRatingImageView.leadingAnchor.constraint(equalTo: restaurantImageView.trailingAnchor, constant: 20).isActive = true
        theForkRatingImageView.topAnchor.constraint(equalTo: restaurantNameLabel.bottomAnchor, constant: 5).isActive = true
        theForkRatingImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        theForkRatingImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        theForkRatingLabel.leadingAnchor.constraint(equalTo: theForkRatingImageView.trailingAnchor, constant: 5).isActive = true
        theForkRatingLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        theForkRatingLabel.centerYAnchor.constraint(equalTo: theForkRatingImageView.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupCell(restaurant: Restaurant) {
        restaurantNameLabel.text = restaurant.name
        restaurantImageView.downloadImage(from: (restaurant.mainPhoto?.source).orEmpty)
        theForkRatingLabel.text = "\(restaurant.aggregateRatings.thefork.ratingValue)"
    }
}
