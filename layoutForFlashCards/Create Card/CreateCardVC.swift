//
//  CreateCardVC.swift
//  layoutForFlashCards
//
//  Created by Ashlee Krammer on 2/17/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import UIKit

class CreateCardVC: UIViewController {

    var categoryName = ""
    
    init(category: String) {
        super.init(nibName: nil, bundle: nil)
        self.categoryName = category
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Variables 
    var createCardView = CreateCardView()
    
    //View Did Load 
    override func viewDidLoad() {
        super.viewDidLoad()
        DBService.manager.delegate = self
        view.addSubview(createCardView)
        view.backgroundColor = .black
        createCardView.cancelButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        createCardView.submitButton.addTarget(self, action: #selector(submitCard), for: .touchUpInside)
    }
    
    @objc private func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func submitCard() {
        //TODO: check for nil 
        DBService.manager.addCard(question: createCardView.questionTF.text!, answer: createCardView.answerTF.text!, category: categoryName)
        print("card submit button pressed")
        dismiss(animated: true, completion: nil)
    }

}

extension CreateCardVC: DBServiceDelegate {
    func didAddCard() {
        print("Card Added")
    }
    
    func didFailToAddCard() {
        print("No card added")
    }
}
