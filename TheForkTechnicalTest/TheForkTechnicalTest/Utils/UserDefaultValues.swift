//
//  UserDefaultValues.swift
//  TheForkTechnicalTest
//
//  Created by Alban on 14/10/2021.
//

import Foundation

struct UserDefaultValues {
    @UserDefault(key: "favoriteKeys", defaultValue: [])
    static var favoriteKeys: [String]
}

@propertyWrapper
struct UserDefault<Value> {
    let key: String
    let defaultValue: Value
    
    init(key: String, defaultValue: Value) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: Value {
        get {
            (UserDefaults.standard.object(forKey: self.key) as? Value) ?? self.defaultValue
            
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: self.key)
        }
    }
    
    var projectedValue: Self {
        get {
            return self
        }
    }
    
    func removeValue() {
        UserDefaults.standard.removeObject(forKey: self.key)
    }
}
