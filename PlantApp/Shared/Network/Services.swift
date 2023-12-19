//
//  Services.swift
//  PlantApp
//
//  Created by Emre Dagci on 8.12.2023.
//

import Foundation

enum Services {
    case GetCategories
    case GetQuestions
}

extension Services : TargetType {
    
    var baseURL: String {
        return "https://dummy-api-jtg6bessta-ey.a.run.app"
    }
    
    var path: String {
        switch self {
        case .GetCategories:
            return "/getCategories"
        case .GetQuestions:
            return "/getQuestions"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    var urlRequest: URLRequest {
        switch self {
        
        default:
            return requestPlain()
        }
    }
    
}
