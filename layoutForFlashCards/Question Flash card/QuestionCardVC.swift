//
//  CardVC.swift
//  layoutForFlashCards
//
//  Created by Ashlee Krammer on 2/17/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import UIKit

class QuestionCardVC: UIViewController {

    var categoryName: String = ""
    var flashCards = [Card]()
    init(category: String) {
        super.init(nibName: nil, bundle: nil)
        self.categoryName = category
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    //Variables
    var questionCardView = QuestionCardView()
    var counter = 0
    //View Did Load 
    override func viewDidLoad() {
        super.viewDidLoad()
        CategoriesTableVC().delegate = self
        print(categoryName)
        //Setting the cards based on the category being sent over
        DBService.manager.getCards { (allTheUsersCards) in
            self.flashCards = allTheUsersCards.filter{ $0.category == self.categoryName}
            if self.flashCards.isEmpty {
                self.emptyCards()
                self.questionCardView.questionLabel.text = "No Cards Available"
                self.questionCardView.seeAnswerButton.isHidden = true
                self.questionCardView.nextQuestionButton.isHidden = true
                
            } else {
                self.questionCardView.seeAnswerButton.isHidden = false
                self.questionCardView.nextQuestionButton.isHidden = false
                var randomNum = Int(arc4random_uniform(UInt32(self.flashCards.count)))
                self.questionCardView.questionLabel.text = self.flashCards[randomNum].question
                self.questionCardView.answerLabel.text = self.flashCards[randomNum].answer
            }
        }
        view.addSubview(questionCardView)
        questionCardView.dismissButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        questionCardView.addCardButton.addTarget(self, action: #selector(addCard), for: .touchUpInside)
        questionCardView.seeAnswerButton.addTarget(self, action: #selector(seeAnswer), for: .touchUpInside)
        questionCardView.nextQuestionButton.addTarget(self, action: #selector(nextQuestion), for: .touchUpInside)
    }

    func emptyCards() {
        let newCard = CreateCardVC(category: categoryName)
        present(newCard, animated: true, completion: nil)
        
    }
    
    @objc private func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func addCard() {
        let newCard = CreateCardVC(category: categoryName)
        present(newCard, animated: true, completion: nil)
    }
    
    @objc private func seeAnswer() {
        questionCardView.answerLabel.textColor = .white
    }
    
    @objc private func nextQuestion() {
        questionCardView.answerLabel.textColor = .black
        var randomNum = Int(arc4random_uniform(UInt32(flashCards.count)))
        self.questionCardView.questionLabel.text = self.flashCards[randomNum].question
        self.questionCardView.answerLabel.text = self.flashCards[randomNum].answer
    }

}

extension QuestionCardVC: CategoriesTableVCDelegate {
    
    func didSegue(category: String) {
        print(category)
    }
}
