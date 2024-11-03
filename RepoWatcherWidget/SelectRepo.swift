//
//  SelectRepo.swift
//  RepoWatcher
//
//  Created by Szekely Janos on 2024. 10. 31..
//

import AppIntents
import Foundation

struct SelectRepo: AppIntent, WidgetConfigurationIntent, CustomIntentMigratedAppIntent {
    static var intentClassName = "SelectRepoIntent"
    static var title: LocalizedStringResource = "Select Repo"
    static var description: IntentDescription? = "Choose a repository to watch"
    
    @Parameter(title: "Repo", optionsProvider: RepoOptionsProvider())
    var repo: String?
    
    struct RepoOptionsProvider: DynamicOptionsProvider {
        func results() async throws -> [String] {
            guard let repos = UserDefaults.shared.value(forKey: UserDefaults.repoKey) as? [String] else {
                throw UserDefaultsError.invalidValue
            }
            return repos
        }
        
        func defaultResult() async -> String? {
            return "google/GoogleSignIn-iOS"
        }
    }
}
