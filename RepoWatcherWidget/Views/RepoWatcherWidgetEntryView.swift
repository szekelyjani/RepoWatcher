//
//  RepoWatcherWidgetEntryView.swift
//  RepoWatcherWidgetExtension
//
//  Created by Szekely Janos on 2024. 10. 29..
//

import SwiftUI

struct RepoWatcherWidgetEntryView : View {
    @Environment(\.widgetFamily) private var family
    var entry: Provider.Entry

    var body: some View {
        switch family {
        case .systemMedium:
            RepoMediumView(repo: entry.repo)
        case .systemLarge:
            EmptyView()
        default: Text("Under development...")
        }
    }
}

#Preview {
    RepoWatcherWidgetEntryView(entry: Provider.Entry(date: Date(), repo: MockData.repo1))
}
