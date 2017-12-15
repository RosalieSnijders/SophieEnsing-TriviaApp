//
//  ScoreData.swift
//  TriviaApp
//
//  Created by Sophie Ensing on 15-12-17.
//  Copyright © 2017 Sophie Ensing. All rights reserved.
//

import Foundation

struct Score {
    var id: String?
    var email: String?
    var score: Int?
    
    init(id: String?, email: String?, score: Int?){
        self.id = id
        self.email = email
        self.score = score
    }
}
