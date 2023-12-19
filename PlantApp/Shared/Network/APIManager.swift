//
//  APIManager.swift
//  PlantApp
//
//  Created by Emre Dagci on 8.12.2023.
//

import Foundation

protocol APIManagerProtocol {
    func fetch<T: Decodable>(_ endpoint: Services) async throws -> T
}

struct APIManager: APIManagerProtocol {
    
    func fetch<T: Decodable>(_ endpoint: Services) async throws -> T {
        //debugPrint("⚡️⚡️ Request : \(endpoint.method.rawValue) \(endpoint.urlRequest.url?.absoluteString ?? "")")
        //debugPrint("⚡️⚡️ Request Headers : \(endpoint.headers ?? [:])")
        guard let url = endpoint.urlRequest.url else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        if let dataString = String(data: data, encoding: .utf8) {
            //debugPrint("⚡️⚡️ Response: \(dataString)")
        }
        
        guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(T.self, from: data)
        
        return decodedData
    }
    
}

