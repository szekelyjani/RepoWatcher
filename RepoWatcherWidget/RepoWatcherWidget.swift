//
//  RepoWatcherWidget.swift
//  RepoWatcherWidget
//
//  Created by Szekely Janos on 2024. 10. 29..
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> RepoEntry {
        RepoEntry(date: Date(), repo: MockData.repo1)
    }
    
    func snapshot(for configuration: SelectRepo, in context: Context) async -> RepoEntry {
        RepoEntry(date: Date(), repo: MockData.repo1)
    }
    
    func timeline(for configuration: SelectRepo, in context: Context) async -> Timeline<RepoEntry> {
        let nextUpdate = Date().addingTimeInterval(43200) // 12 hours in seconds
        
        do {
            let repoToShow = RepoURL.prefix + (configuration.repo ?? RepoURL.defaultRepo)
            var repo = try await NetworkManager.shared.getRepo(url: repoToShow)
            let avatarImage = await NetworkManager.shared.downloadImageData(from: repo.owner.avatarUrl)
            repo.avatarData = avatarImage ?? Data()
            
            let entry = RepoEntry(date: Date(), repo: repo)
            return Timeline(entries: [entry], policy: .after(nextUpdate))
        } catch {
            print("Ooops")
            return Timeline(entries: [], policy: .after(nextUpdate))
        }
    }
    
}

struct RepoWatcherWidget: Widget {
    let kind: String = "RepoWatcherWidget"
    
    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind,
                               intent: SelectRepo.self,
                               provider: Provider()) { entry in
            RepoWatcherWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("Repo watcher widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemMedium, .systemLarge])
    }
}

#Preview(as: .systemMedium) {
    RepoWatcherWidget()
} timeline: {
    RepoEntry(date: .now, repo: MockData.repo1)
    RepoEntry(date: .now, repo: MockData.repo2)
}
