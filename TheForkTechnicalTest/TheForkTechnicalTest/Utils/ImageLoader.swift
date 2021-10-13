//
//  ImageLoader.swift
//  TheForkTechnicalTest
//
//  Created by Alban on 13/10/2021.
//

import UIKit

final class ImageLoader {

    static let shared = ImageLoader()

    /// Cache is invalidate every force quit of the app
    /// We could add a timer to invalidate it every hour as well
    private let cache: NSCache<NSString, UIImage> = NSCache()

    private init() {}

    func retrieveImage(from url: String, completionHandler: @escaping (UIImage) -> Void) {
        if let image = self.cache.object(forKey: url as NSString) {
            Thread.onMainThread {
                completionHandler(image)
            }
        } else {
            BaseRequest.downloadImage(from: url) { result in
                switch result {
                case .success(let image):
                    Thread.onMainThread {
                        completionHandler(image)
                    }
                case .failure:
                    Thread.onMainThread {
                        completionHandler(#imageLiteral(resourceName: "tf-logo"))
                    }
                }
            }
        }
    }
}
