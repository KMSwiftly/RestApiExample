//
//  NetworkManager.swift
//  RestApi
//

import Foundation


class NetworkManager{
    static let shared = NetworkManager()
    private init(){}
    
    @MainActor
    func fetchData<T: Codable>(url: String) async throws -> T{
        guard let url = URL(string: url) else{
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else{
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else{
            throw NetworkError.serverError(httpResponse.statusCode)
        }
        
        do{
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch{
            throw NetworkError.decodingError
        }
    }
}
