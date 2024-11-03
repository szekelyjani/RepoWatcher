//
//  RepoWatcherWidgetEntryView.swift
//  RepoWatcherWidgetExtension
//
//  Created by Szekely Janos on 2024. 10. 29..
//

import SwiftUI
import WidgetKit

struct RepoWatcherWidgetEntryView : View {
    @Environment(\.widgetFamily) private var family
    var entry: Provider.Entry

    var body: some View {
        switch family {
        case .systemMedium:
            RepoMediumView(repo: entry.repo)
        case .systemLarge:
            VStack(spacing: 60) {
                RepoMediumView(repo: entry.repo)
                ContributorMediumView(repo: entry.repo)
            }
        default: Text("Under development...")
        }
    }
}

#Preview(as: .systemLarge) {
    RepoWatcherWidget()
} timeline: {
    RepoEntry(date: .now, repo: MockData.repo1)
    RepoEntry(date: .now, repo: MockData.repo2)
}
