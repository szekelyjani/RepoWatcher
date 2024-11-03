//
//  RepoWatcherLockScreenRectangularView.swift
//  RepoWatcherWidgetExtension
//
//  Created by Szekely Janos on 2024. 11. 03..
//

import SwiftUI
import WidgetKit

struct RepoWatcherLockScreenRectangularView: View {
    let entry: RepoEntry
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(entry.repo.name)")
                .font(.headline)
                .minimumScaleFactor(0.7)
            Text("\(entry.repo.daySinceLastActivity) days")
            
            Spacer()
            
            HStack {
                Label("\(entry.repo.contributors.count)", systemImage: "star.fill")
                Label("\(entry.repo.forks)", systemImage: "tuningfork")
                if entry.repo.hasIssues {
                    Label("\(entry.repo.openIssues)", systemImage: "exclamationmark.triangle.fill")
                }
            }
            .font(.caption)
        }
    }
}

#Preview(as: .accessoryRectangular) {
    RepoWatcherWidget()
} timeline: {
    RepoEntry(date: .now, repo: MockData.repo1)
    RepoEntry(date: .now, repo: MockData.repo2)
}
