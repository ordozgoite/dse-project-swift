//
//  LocalState.swift
//  DSE-Project
//
//  Created by Victor Ordozgoite on 19/06/24.
//

import Foundation


public class LocalState {
    
    private enum Keys: String {
        case userRegistrationToken
    }
    
    public static var userRegistrationToken: String {
        get {
            return UserDefaults.standard.string(forKey: Keys.userRegistrationToken.rawValue) ?? ""
        }
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.userRegistrationToken.rawValue)
        }
    }
}
