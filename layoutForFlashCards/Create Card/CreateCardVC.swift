//
//  CreateCardVC.swift
//  layoutForFlashCards
//
//  Created by Ashlee Krammer on 2/17/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import UIKit

class CreateCardVC: UIViewController {

    //Variables 
    var createCardView = CreateCardView()
    
    //View Did Load 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(createCardView)
        view.backgroundColor = .black
        createCardView.cancelButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        createCardView.submitButton.addTarget(self, action: #selector(submitCard), for: .touchUpInside)
    }
    
    @objc private func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func submitCard() {
        //TODO: save question, answer, and category its already in
        print("card submit button pressed")
        dismiss(animated: true, completion: nil)
    }

}
