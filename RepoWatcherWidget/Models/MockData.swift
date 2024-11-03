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
                                  avatarData: Data(),
                                  contributors: [Contributor(id: 1,
                                                             login: "Hudzilla",
                                                             avatarUrl: "https://avatars.githubusercontent.com/u/94728727?v=4",
                                                             contributions: 13,
                                                             avatarData: Data()),
                                                 Contributor(id: 2,
                                                             login: "atrinh0",
                                                             avatarUrl: "",
                                                             contributions: 23,
                                                             avatarData: Data()),
                                                 Contributor(id: 3,
                                                             login: "ishtiaq156",
                                                             avatarUrl: "",
                                                             contributions: 30,
                                                             avatarData: Data()),
                                                 Contributor(id: 4,
                                                             login: "john-mueller",
                                                             avatarUrl: "",
                                                             contributions: 6,
                                                             avatarData: Data())])
    
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
                                  avatarData: Data(),
                                  contributors: [Contributor(id: 1,
                                                             login: "lamtrinhdev",
                                                             avatarUrl: "",
                                                             contributions: 142,
                                                             avatarData: Data()),
                                                 Contributor(id: 2,
                                                             login: "machinemxy",
                                                             avatarUrl: "",
                                                             contributions: 123,
                                                             avatarData: Data()),
                                                 Contributor(id: 3,
                                                             login: "gerrior",
                                                             avatarUrl: "",
                                                             contributions: 130,
                                                             avatarData: Data()),
                                                 Contributor(id: 4,
                                                             login: "michalsrutek",
                                                             avatarUrl: "",
                                                             contributions: 16,
                                                             avatarData: Data())])
}
