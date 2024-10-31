//
//  UserDefaults+Ext.swift
//  RepoWatcher
//
//  Created by Szekely Janos on 2024. 10. 28..
//

import Foundation

extension UserDefaults {
    static var shared: UserDefaults {
        UserDefaults(suiteName: "group.janos.szekely.RepoWatcher")!
    }
    
    static let repoKey = "repoKey"
}

enum UserDefaultsError: Error {
    case invalidValue
}
