//
//  QuizController.swift
//  TriviaApp
//
//  Created by Sophie Ensing on 14-12-17.
//  Copyright © 2017 Sophie Ensing. All rights reserved.
//

import Foundation
import UIKit

class QuizController {
    static let shared = QuizController()
    let baseURL = URL(string: "https://opentdb.com/api.php?")!
    
    let query: [String: String] = [
        "amount": "6",
        "type": "boolean"
    ]
    
    func fetchQuestions(completion: @escaping (Questions?) -> Void) {
        let url = baseURL.withQueries(query)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let Questions = try? jsonDecoder.decode(Questions.self, from: data) {
                completion(Questions)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
}
