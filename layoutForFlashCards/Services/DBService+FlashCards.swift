//
//  DBService+FlashCards.swift
//  layoutForFlashCards
//
//  Created by Ashlee Krammer on 2/20/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//


import Foundation
import Firebase
import FirebaseDatabase

extension DBService{
    
    
    func addCard(question: String, answer: String, category: String, correct: Bool){
        for card in cards{
            if card.question == question{
                self.delegate?.didFailToAddCard!()
                return
            }
        }
        guard let currentUser = AuthUserService.getCurrentUser() else {print("could not get current user"); return}
        let ref = cardRef.childByAutoId()
        let card = Card(question: question, answer: answer, category: category, uID: currentUser.uid)
        ref.setValue(["question": card.question,
                      "answer": card.answer,
                      "uID": card.uID,
                      "category": card.category,
            ])
        self.delegate?.didAddCard!()
    }
    
    
    public func getCards(completion: @escaping (_ category: [Card]) -> Void) {
        cardRef.observe(.value) { (dataSnapshot) in
            var cards = [Card]()
            guard let cardSnapshots = dataSnapshot.children.allObjects as? [DataSnapshot] else {
                return
            }
            for cardSnapshot in cardSnapshots {
                guard let cardObject = cardSnapshot.value as? [String: Any] else {
                    return
                }
                
                guard let question = cardObject["question"] as? String,
                    let answer = cardObject["answer"] as? String,
                    let uID = cardObject["uID"] as? String,
                    let category = cardObject["category"] as? String,
                    let correct = cardObject["correct"] as? Bool
                    else { print("error getting posts");return}
                
                let thisCard = Card(question: question, answer: answer, category: category, uID: uID)
                cards.append(thisCard)
                
            }
            guard let userId = AuthUserService.getCurrentUser()?.uid else {print("cant get current users categories"); return}
            cards = cards.filter{ $0.uID ==  userId}
            DBService.manager.cards = cards
            completion(cards)
        }
    }
    
    
    
    
    
    
    
}
