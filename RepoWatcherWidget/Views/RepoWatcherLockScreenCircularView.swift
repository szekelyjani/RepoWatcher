//
//  RepoWatcherLockScreenCircularView.swift
//  RepoWatcherWidgetExtension
//
//  Created by Szekely Janos on 2024. 11. 03..
//

import SwiftUI
import WidgetKit

struct RepoWatcherLockScreenCircularView: View {
    let entry: RepoEntry
    
    var body: some View {
        ZStack {
            AccessoryWidgetBackground()
            VStack {
                Text("\(entry.repo.daySinceLastActivity)")
                    .font(.headline)
                Text("days")
                    .font(.caption)
            }
        }
    }
}

#Preview(as: .accessoryCircular) {
    RepoWatcherWidget()
} timeline: {
    RepoEntry(date: .now, repo: MockData.repo1)
    RepoEntry(date: .now, repo: MockData.repo2)
}
