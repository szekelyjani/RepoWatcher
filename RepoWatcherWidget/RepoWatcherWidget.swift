//
//  RepoWatcherWidget.swift
//  RepoWatcherWidget
//
//  Created by Szekely Janos on 2024. 10. 29..
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> RepoEntry {
        RepoEntry(date: Date(), repo: MockData.repo1)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (RepoEntry) -> ()) {
        let entry = RepoEntry(date: Date(), repo: MockData.repo1)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<RepoEntry>) -> ()) {
        Task {
            let nextUpdate = Date().addingTimeInterval(43200) // 12 hours in seconds
            
            do {
                let repoToShow = RepoURL.prefix + RepoURL.defaultRepo
                var repo = try await NetworkManager.shared.getRepo(url: repoToShow)
                let avatarImage = await NetworkManager.shared.downloadImageData(from: repo.owner.avatarUrl)
                repo.avatarData = avatarImage ?? Data()
                
                let entry = RepoEntry(date: Date(), repo: repo)
                let timeline = Timeline(entries: [entry], policy: .after(nextUpdate))
                completion(timeline)
            } catch {
                print("Ooops")
            }
        }
    }
    
}

struct RepoWatcherWidget: Widget {
    let kind: String = "RepoWatcherWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            RepoWatcherWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("My Widget")
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
