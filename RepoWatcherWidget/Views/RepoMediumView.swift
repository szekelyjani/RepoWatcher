//
//  RepoMediumView.swift
//  RepoWatcherWidgetExtension
//
//  Created by Szekely Janos on 2024. 10. 29..
//

import SwiftUI
import WidgetKit

struct RepoMediumView: View {
    let repo: Repository
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(uiImage: UIImage(data: repo.avatarData) ?? UIImage(named: "avatar")!)
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 50, height: 50)
                    
                    Text(repo.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .minimumScaleFactor(0.6)
                        .lineLimit(1)
                    
                }
                .padding(.bottom, 6)
                
                HStack {
                    StatLabel(imageName: "star.fill", value: repo.watchers)
                    StatLabel(imageName: "tuningfork", value: repo.forks)
                    if repo.hasIssues {
                        StatLabel(imageName: "exclamationmark.triangle.fill", value: repo.openIssues)
                    }
                }
            }
            
            Spacer()
            
            VStack {
                Text("\(repo.daySinceLastActivity)")
                    .bold()
                    .font(.system(size: 60))
                    .frame(width: 90)
                    .minimumScaleFactor(0.6)
                    .lineLimit(1)
                    .foregroundStyle(repo.daySinceLastActivity > 30 ? .pink : .green)
                
                Text("days ago")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview(as: .systemMedium) {
    RepoWatcherWidget()
} timeline: {
    RepoEntry(date: .now, repo: MockData.repo1)
    RepoEntry(date: .now, repo: MockData.repo2)
}

fileprivate struct StatLabel: View {
    let imageName: String
    let value: Int
    
    var body: some View {
        Label {
            Text("\(value)")
                .font(.footnote)
        } icon: {
            Image(systemName: imageName)
                .foregroundStyle(.green)
        }
        .fontWeight(.medium)
    }
}
