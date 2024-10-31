//
//  Repository.swift
//  RepoWatcher
//
//  Created by Szekely Janos on 2024. 10. 29..
//

import Foundation

struct Repository {
    let name: String
    let owner: Owner
    let openIssues: Int
    let watchers: Int
    let hasIssues: Bool
    let forks: Int
    let pushedAt: Date
    var avatarData: Data
    
    var daySinceLastActivity: Int {
        let daySinceLastActivity = Calendar.current.dateComponents([.day], from: pushedAt, to: .now).day
        return daySinceLastActivity ?? 0
    }
}

extension Repository {
    struct CodingData: Codable {
        let name: String
        let owner: Owner
        let openIssues: Int
        let watchers: Int
        let hasIssues: Bool
        let forks: Int
        let pushedAt: Date
        
        var repo: Repository {
            Repository(
                name: name,
                owner: owner,
                openIssues: openIssues,
                watchers: watchers,
                hasIssues: hasIssues,
                forks: forks,
                pushedAt: pushedAt,
                avatarData: Data()
            )
        }
    }
}

struct Owner: Codable {
    let avatarUrl: String
}
