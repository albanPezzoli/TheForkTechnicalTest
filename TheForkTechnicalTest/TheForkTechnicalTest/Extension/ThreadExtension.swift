//
//  ThreadExtension.swift
//  TheForkTechnicalTest
//
//  Created by Alban on 13/10/2021.
//

import Foundation

extension Thread {
    class func onMainThread(completionHandler: @escaping (() -> Void)) {
        if Thread.current.isMainThread {
            completionHandler()
            return
        } else {
            DispatchQueue.main.async {
                completionHandler()
            }
        }
    }
}
