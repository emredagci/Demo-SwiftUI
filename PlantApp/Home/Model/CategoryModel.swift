//
//  CategoryModel.swift
//  PlantApp
//
//  Created by Emre Dagci on 8.12.2023.
//

import Foundation

struct CategoryListModel: Codable {
    var data: [CategoryModel]?
}

struct CategoryModel: Codable, Hashable {
    var id: Int?
    var name: String?
    var createdAt: String?
    var publishedAt: String?
    var title: String?
    var rank: Int?
    var image: CategoryImageModel?
}

struct CategoryImageModel: Codable, Hashable {
    var id: Int?
    var name: String?
    var width: Int?
    var height: Int?
    var hash: String?
    var ext: String?
    var size: Double?
    var url: String?
    var provider: String?
    var createdAt: String?
    var publishedAt: String?
}
