//
//  BaseRequest.swift
//  TheForkTechnicalTest
//
//  Created by Alban on 12/10/2021.
//

import UIKit

final class BaseRequest {
    static func GET<T: Decodable>(from urlString: String, completionHandler: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            let error = NSError(domain: "errorFormatedURL".localized, code: 500, userInfo: nil)
            completionHandler(.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let decodable = try JSONDecoder().decode(T.self, from: data)
                completionHandler(.success(decodable))
            } catch let error {
                completionHandler(.failure(error))
            }
        }
        task.resume()
    }
    
    static func downloadImage(from urlString: String, completionHandler: @escaping (Result<UIImage, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            let error = NSError(domain: "errorFormatedURL".localized, code: 500, userInfo: nil)
            completionHandler(.failure(error))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                  let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                  let data = data, error == nil,
                  let image = UIImage(data: data) else {
                let error = NSError(domain: "errorFormatedURL".localized, code: 500, userInfo: nil)
                completionHandler(.failure(error))
                return
            }
            completionHandler(.success(image))
        }.resume()
    }
}
