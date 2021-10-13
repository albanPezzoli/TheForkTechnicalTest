//
//  OptionalExtension.swift
//  TheForkTechnicalTest
//
//  Created by Alban on 13/10/2021.
//

import Foundation

extension Optional where Wrapped == String {
    var orEmpty: String {
        switch self {
        case .some(let value):
            return value
        case .none:
            return ""
        }
    }
}
