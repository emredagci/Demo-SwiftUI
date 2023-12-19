//
//  TargetType.swift
//  PlantApp
//
//  Created by Emre Dagci on 8.12.2023.
//

import Foundation

enum HTTPMethod: String {
    case post = "POST"
    case get = "GET"
    case delete = "DELETE"
    case put = "PUT"
}

protocol TargetType {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod {get}
    var headers: [String: String]? { get }
    var urlRequest: URLRequest { get }
}

extension TargetType {
    func requestPlain() -> URLRequest {
        var urlComponents = URLComponents(string: baseURL)
        urlComponents?.path = path
        var request = URLRequest(url: urlComponents?.url ?? URL(string: "")!)
        request.httpMethod = method.rawValue
        return request
    }
}
