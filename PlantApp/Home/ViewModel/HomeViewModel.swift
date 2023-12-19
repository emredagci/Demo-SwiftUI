//
//  HomeViewModel.swift
//  PlantApp
//
//  Created by Emre Dagci on 8.12.2023.
//

import Foundation
 
@MainActor
class HomeViewModel: ObservableObject {
    
    private let apiManager: APIManagerProtocol
    @Published var categoryList: [CategoryModel] = []
    @Published var questionList: [QuestionModel] = []
    @Published var searchText: String = ""
    var initialCategoryList: [CategoryModel] = []
    
    init(apiManager: APIManagerProtocol = APIManager()) {
        self.apiManager = apiManager
    }
    
    func getCategories() async {
        do {
            let response: CategoryListModel = try await apiManager.fetch(.GetCategories)
            categoryList = response.data ?? []
            initialCategoryList = categoryList
        } catch {
            debugPrint(error)
        }
    }
    
    func getQuestions() async {
        do {
            let response: QuestionList = try await apiManager.fetch(.GetQuestions)
            questionList = response
        } catch {
            debugPrint(error)
        }
    }
    
    func searchCategories() {
        if searchText.count > 2 {
            categoryList = initialCategoryList.filter({$0.title?.lowercased().contains(searchText.lowercased()) == true})
        } else {
            if searchText.isEmpty {
                categoryList = initialCategoryList
            }
        }
    }
    
}
