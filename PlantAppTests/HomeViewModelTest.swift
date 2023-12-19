//
//  HomeViewModelTest.swift
//  PlantAppTests
//
//  Created by Emre Dagci on 9.12.2023.
//

import XCTest
@testable import PlantApp

final class HomeViewModelTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    @MainActor func testGetCategories() async {
        let apiManager = APIManager()
        let viewModel = HomeViewModel(apiManager: apiManager)
        
        
        await viewModel.getCategories()
        XCTAssertFalse(viewModel.categoryList.isEmpty, "Categories should not be empty after fetching.")
    }
    
    @MainActor func testGetQuestions() async {
        let apiManager = APIManager()
        let viewModel = HomeViewModel(apiManager: apiManager)
        
        await viewModel.getQuestions()
        XCTAssertFalse(viewModel.questionList.isEmpty, "Questions should not be empty after fetching.")
    }
    
    @MainActor func testGetCategoriesMock() async {
        let apiManager = MockAPIManager()
        let category = CategoryModel(
            id: 1,
            name: "Plant",
            image: CategoryImageModel(url:"https://cms-cdn.plantapp.app/6_edbcc6988a/6_edbcc6988a.png")
        )
        var categoryList : [CategoryModel] = []
        categoryList.append(category)
        let categoryListResponse = CategoryListModel(data: categoryList)
        
        apiManager.categoryListResponse = categoryListResponse
        let viewModel = HomeViewModel(apiManager: apiManager)
        
        await viewModel.getCategories()
        XCTAssertFalse(viewModel.categoryList.isEmpty, "Mock Categories should not be empty after fetching.")

    }
    
    @MainActor func testGetQuestionsMock() async {
        let apiManager = MockAPIManager()
        let question = QuestionModel(
            id: 1,
            title: "How to identify plants?",
            subtitle: "Life Style",
            image_uri: "https://firebasestorage.googleapis.com/v0/b/flora---plant-identifier.appspot.com/o/public%2FCard.png?alt=media",
            uri: "", 
            order: 1
        )
        
        var questionList : QuestionList = []
        questionList.append(question)
        apiManager.questionListResponse = questionList
        let viewModel = HomeViewModel(apiManager: apiManager)
        
        await viewModel.getQuestions()
        XCTAssertFalse(viewModel.questionList.isEmpty, "Mock Question should not be empty after fetching.")

    }
    
    @MainActor func testSearchExistText() async {
        let apiManager = MockAPIManager()
        let categoryPlant = CategoryModel(id: 1, title: "Plant", image: CategoryImageModel(url:"https://cms-cdn.plantapp.app/6_edbcc6988a/6_edbcc6988a.png"))
        let categoryTree = CategoryModel(id: 1, title: "Tree", image: CategoryImageModel(url:"https://cms-cdn.plantapp.app/6_edbcc6988a/6_edbcc6988a.png"))
        var categoryList : [CategoryModel] = []
        categoryList.append(categoryPlant)
        categoryList.append(categoryTree)
        let categoryListResponse = CategoryListModel(data: categoryList)
        
        apiManager.categoryListResponse = categoryListResponse
        let viewModel = HomeViewModel(apiManager: apiManager)
        
        await viewModel.getCategories()
        
        viewModel.searchText = "Pla"
        viewModel.searchCategories()
        XCTAssertFalse(viewModel.categoryList.isEmpty, "Mock Categories should not be empty after searching.")
    }
    
    @MainActor func testSearchEmpty() async {
        let apiManager = MockAPIManager()
        let categoryPlant = CategoryModel(id: 1, title: "Plant", image: CategoryImageModel(url:"https://cms-cdn.plantapp.app/6_edbcc6988a/6_edbcc6988a.png"))
        let categoryTree = CategoryModel(id: 1, title: "Tree", image: CategoryImageModel(url:"https://cms-cdn.plantapp.app/6_edbcc6988a/6_edbcc6988a.png"))
        var categoryList : [CategoryModel] = []
        categoryList.append(categoryPlant)
        categoryList.append(categoryTree)
        let categoryListResponse = CategoryListModel(data: categoryList)
        
        apiManager.categoryListResponse = categoryListResponse
        let viewModel = HomeViewModel(apiManager: apiManager)
        
        await viewModel.getCategories()
        
        viewModel.searchText = "Vegetables and Fruits"
        viewModel.searchCategories()
        XCTAssertTrue(viewModel.categoryList.isEmpty, "Mock Categories should be empty after searching.")
    }
    
}
