//
//  StringExtension.swift
//  TheForkTechnicalTest
//
//  Created by Alban on 12/10/2021.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
