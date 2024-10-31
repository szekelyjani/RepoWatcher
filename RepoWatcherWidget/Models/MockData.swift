//
//  MockData.swift
//  RepoWatcherWidgetExtension
//
//  Created by Szekely Janos on 2024. 10. 29..
//

import Foundation

struct MockData {
    static let repo1 = Repository(name: "Paul Hudson",
                                  owner: Owner(avatarUrl: ""),
                                  openIssues: 2,
                                  watchers: 99,
                                  hasIssues: true,
                                  forks: 31,
                                  pushedAt: DateComponents(calendar: Calendar.current,
                                                           year: 2024,
                                                           month: 10,
                                                           day: 29).date ?? .now,
                                  avatarData: Data())
    
    static let repo2 = Repository(name: "Paul Hudson",
                                  owner: Owner(avatarUrl: ""),
                                  openIssues: 2,
                                  watchers: 99,
                                  hasIssues: true,
                                  forks: 31,
                                  pushedAt: DateComponents(calendar: Calendar.current,
                                                           year: 2024,
                                                           month: 10,
                                                           day: 29).date ?? .now,
                                  avatarData: Data())
}
