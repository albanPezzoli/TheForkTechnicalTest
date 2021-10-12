//
//  Environment.swift
//  TheForkTechnicalTest
//
//  Created by Alban on 12/10/2021.
//

import Foundation

public enum Environment {
    enum Keys {
        static let baseURL = "BASE_URL"
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    static let baseURL: String = {
        guard let baseURLString = Environment.infoDictionary[Keys.baseURL] as? String else {
            fatalError("Base URL not set in plist for this environment")
        }
        guard let url = URL(string: baseURLString) else {
            fatalError("Base URL is invalid")
        }
        return url.absoluteString
    }()
}
