//
//  RepoListView.swift
//  RepoWatcher
//
//  Created by Szekely Janos on 2024. 10. 28..
//

import SwiftUI

struct RepoListView: View {
    @State private var newRepo = ""
    @State private var repos: [String] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("Add repo", text: $newRepo)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .textFieldStyle(.roundedBorder)
                    
                    Button {
                        if !repos.contains(newRepo) && !newRepo.isEmpty {
                            repos.append(newRepo)
                            saveRepos()
                            newRepo = ""
                        } else {
                            print("Repo already added.")
                        }
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(.green.opacity(newRepo.isEmpty ? 0.3 : 1.0))
                    }
                    .disabled(newRepo.isEmpty)
                }
                .padding()
                
                Form {
                    Section("Saved Repos"){
                        List(repos, id: \.self) { repo in
                            Text(repo)
                                .swipeActions {
                                    Button("Delete", role: .destructive) {
                                        if repos.count > 1 {
                                            repos.removeAll { $0 == repo }
                                            saveRepos()
                                        }
                                    }
                                }
                        }
                    }
                }
            }
            .navigationTitle("Repo List")
            .onAppear {
                guard let savedRepos = UserDefaults.shared.value(forKey: UserDefaults.repoKey) as? [String] else {
                    let defaultValues = ["twostraws/HackingWithSwift"]
                    UserDefaults.shared.set(defaultValues, forKey: UserDefaults.repoKey)
                    repos = defaultValues
                    return
                }
                repos = savedRepos
            }
        }
    }
    
    private func saveRepos() {
        UserDefaults.shared.set(repos, forKey: UserDefaults.repoKey)
    }
}

#Preview {
    RepoListView()
}
