//
//  MockAPIManager.swift
//  PlantApp
//
//  Created by Emre Dagci on 9.12.2023.
//

import Foundation

class MockAPIManager: APIManagerProtocol {
    var categoryListResponse: CategoryListModel?
    var questionListResponse: QuestionList?
    var error: Error?
    
    func fetch<T>(_ endpoint: Services) async throws -> T where T : Decodable {
        if let error = error {
            throw error
        }
        
        switch endpoint {
        case .GetCategories:
            return categoryListResponse as! T
        case .GetQuestions:
            return questionListResponse as! T
        }
    }
    
}
