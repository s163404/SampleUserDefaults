//
//  State.swift
//  SampleUserDefaults
//
//  Created by 冨田康介 on 2021/01/11.
//  Copyright © 2021 kosuketomita. All rights reserved.
//

import Foundation

final class State{
    public static var shared = State()
    
    private let userDefaults = UserDefaults.standard
    
    private init() {
        userDefaults.register(defaults:[
            Key.hasPurchase.rawValue:   false,
            Key.isSingle.rawValue:      true
        ])
    }
    
    func setHasPurchase(value: Bool) {
        userDefaults.set(value, forKey: Key.hasPurchase.rawValue)
    }
    func getHasPurchase() -> Bool {
        userDefaults.bool(forKey: Key.hasPurchase.rawValue)
    }
    
    
    enum Key: String {
        case hasPurchase
        case isSingle
    }
    
    
}
