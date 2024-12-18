//
//  NetworkManager.swift
//  RepoWatcher
//
//  Created by Szekely Janos on 2024. 10. 30..
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    let decoder = JSONDecoder()
    
    init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
    }
    
    func fetchData<T>(from urlString: String) async throws -> T where T: Decodable {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidRepoURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        do {
            let codingData = try decoder.decode(T.self, from: data)
            return codingData
        } catch {
            throw NetworkError.invalidResponse
        }
    }
    
    func downloadImageData(from urlString: String) async -> Data? {
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch {
            return nil
        }
    }
}

enum NetworkError: Error {
    case invalidRepoURL, invalidResponse, invalidRepoData
}

enum RepoURL {
    static let prefix = "https://api.github.com/repos/"
    static let defaultRepo = "twostraws/HackingWithSwift"
    static let google = "google/GoogleSignIn-iOS"
}
