//
//  UserDefaultsHelper.swift
//  Vagas
//
//  Created by Hugo Coutinho on 15/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation
class UserDefaultsHelper {
    class func setValueStringForKey(value: String, key: UserDefaultsKey) {
        let defaults = UserDefaults.standard
        defaults.setValue(value, forKey: key.rawValue)
        UserDefaults.standard.synchronize();
    }
    
    class func getValueForKey(_ key: UserDefaultsKey) -> String? {
        let defaults = UserDefaults.standard
        let valueForKey = defaults.string(forKey: key.rawValue)
        UserDefaults.standard.synchronize();
        return valueForKey
    }
}
