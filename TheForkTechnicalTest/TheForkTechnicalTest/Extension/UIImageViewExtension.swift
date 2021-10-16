//
//  UIImageViewExtension.swift
//  TheForkTechnicalTest
//
//  Created by Alban on 13/10/2021.
//

import UIKit

extension UIImageView {
    func downloadImage(from url: String, contentMode mode: ContentMode = .scaleAspectFit) {
        let activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.startAnimating()
        self.addSubview(activityIndicator)
        
        // Set the indicator on the center of the imageView
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        ImageLoader.shared.retrieveImage(from: url as NSString) { image in
            self.image = image
            self.contentMode = mode
            // We should remove activity indicator now
            activityIndicator.removeFromSuperview()
        }
    }
    
    func cancelDataTask(for url: String) {
        ImageLoader.shared.cancelDataTask(for: url as NSString)
    }
}
