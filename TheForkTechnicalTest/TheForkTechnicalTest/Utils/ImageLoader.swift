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
    private var dataTasks: [NSString: URLSessionDataTask?] = [:]

    private init() {}

    func retrieveImage(from url: NSString, completionHandler: @escaping (UIImage) -> Void) {
        if let image = self.cache.object(forKey: url) {
            Thread.onMainThread {
                completionHandler(image)
            }
        } else {
            dataTasks[url] = BaseRequest.downloadImage(from: url as String) {[weak self] result in
                switch result {
                case .success(let image):
                    self?.cache.setObject(image, forKey: url)
                    Thread.onMainThread {
                        completionHandler(image)
                    }
                case .failure:
                    let imageByDefault = #imageLiteral(resourceName: "tf-logo")
                    self?.cache.setObject(imageByDefault, forKey: url)
                    Thread.onMainThread {
                        completionHandler(imageByDefault)
                    }
                }
                self?.dataTasks.removeValue(forKey: url)
            }
        }
    }
    
    func cancelDataTask(for url: NSString) {
        if self.cache.object(forKey: url) == nil {
            // Flatmap used to transform Optional(Optional(String)) into Optional(String)
            let dataTask = dataTasks.removeValue(forKey: url)?.flatMap({$0})
            dataTask?.cancel()
        }
    }
}
