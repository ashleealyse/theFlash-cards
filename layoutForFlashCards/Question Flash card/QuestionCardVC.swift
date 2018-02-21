//
//  CardVC.swift
//  layoutForFlashCards
//
//  Created by Ashlee Krammer on 2/17/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import UIKit

class QuestionCardVC: UIViewController {

    //Variables
    var questionCardView = QuestionCardView()
    
    //View Did Load 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(questionCardView)
        questionCardView.dismissButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        questionCardView.addCardButton.addTarget(self, action: #selector(addCard), for: .touchUpInside)
        questionCardView.seeAnswerButton.addTarget(self, action: #selector(seeAnswer), for: .touchUpInside)
        questionCardView.nextQuestionButton.addTarget(self, action: #selector(nextQuestion), for: .touchUpInside)
    }

    
    @objc private func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func addCard() {
        let newCard = CreateCardVC()
        present(newCard, animated: true, completion: nil)
    }
    
    @objc private func seeAnswer() {
        questionCardView.answerLabel.textColor = .white
    }
    
    @objc private func nextQuestion() {
        questionCardView.answerLabel.textColor = .black
        //set new question
    }

}
