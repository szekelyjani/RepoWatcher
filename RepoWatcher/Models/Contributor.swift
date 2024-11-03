//
//  Contributor.swift
//  RepoWatcher
//
//  Created by Szekely Janos on 2024. 10. 31..
//

import Foundation

struct Contributor: Identifiable {
    let id: Int
    let login: String
    let avatarUrl: String
    let contributions: Int
    var avatarData: Data
}

extension Contributor {
    struct CodingData: Codable {
        let id: Int
        let login: String
        let avatarUrl: String
        let contributions: Int
        
        var contributor: Contributor {
            Contributor(id: id,
                        login: login,
                        avatarUrl: avatarUrl,
                        contributions: contributions,
                        avatarData: Data()
            )
        }
    }
}
