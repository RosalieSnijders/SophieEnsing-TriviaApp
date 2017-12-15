//
//  QuestionData.swift
//  TriviaApp
//
//  Created by Sophie Ensing on 13-12-17.
//  Copyright © 2017 Sophie Ensing. All rights reserved.
//

import Foundation

struct Question: Codable {
    var category: String
    var type: String
    var difficulty: String
    var question: String
    var correct_answer: String
    var incorrect_answers: [String]
}

struct Questions: Codable {
    let results: [Question]
}
