//
//  FlashCard.swift
//  layoutForFlashCards
//
//  Created by Ashlee Krammer on 2/17/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import Foundation

struct Card {
    
    var question: String
    var answer: String
    var category: String
    var uID: String
    
    init(question: String, answer: String, category: String, uID: String) {
        self.question = question
        self.answer = answer
        self.category = category
        self.uID = uID
    }
}
