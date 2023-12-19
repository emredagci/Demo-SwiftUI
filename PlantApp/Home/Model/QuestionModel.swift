//
//  QuestionModel.swift
//  PlantApp
//
//  Created by Emre Dagci on 8.12.2023.
//

import Foundation

typealias QuestionList = [QuestionModel]

struct QuestionModel: Decodable, Hashable {
    var id: Int?
    var title: String?
    var subtitle: String?
    var image_uri: String?
    var uri: String?
    var order: Int?
}
