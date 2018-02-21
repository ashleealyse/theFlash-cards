//
//  CardView.swift
//  layoutForFlashCards
//
//  Created by Ashlee Krammer on 2/17/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import UIKit
import SnapKit

class QuestionCardView: UIView {
    
    //Segue from Table View Cell
    
    lazy var topView: UIView = {
       let tV = UIView()
        tV.backgroundColor = .white
        return tV
    }()
    
    lazy var addCardButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "cards"), for: .normal)
        return button
    }()
    
    lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "cancel"), for: .normal)
        return button
    }()
    
    lazy var questionLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    lazy var seeAnswerButton: UIButton = {
       let button = UIButton()
        button.setTitle("seeAnswer", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.0
        return button
    }()
    
    lazy var bottomView: UIView = {
        let bV = UIView()
        bV.backgroundColor = .black
        return bV
    }()
    
    lazy var answerLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var nextQuestionButton: UIButton = {
        let button = UIButton()
        button.setTitle("nextQuestion", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1.0
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUpViews() {
        setUpTopView()
        setUpBottomView()
        setUpNewCardButton()
        setUpDismissButton()
        setUpQuestionLabel()
        setUpSeeAnswerButton()
        setUpAnswerLabel()
        setUpNextQuestionButton()
    }
    
    func setUpTopView() {
        addSubview(topView)
        topView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(safeAreaLayoutGuide).multipliedBy(0.5)
        }
    }
    
    func setUpNewCardButton() {
        addSubview(addCardButton)
        addCardButton.snp.makeConstraints { (make) in
            make.top.equalTo(topView.snp.top).offset(5)
            make.leading.equalTo(topView.snp.leading).offset(5)
        }
    }
    
    func setUpDismissButton() {
        addSubview(dismissButton)
        dismissButton.snp.makeConstraints { (make) in
            make.top.equalTo(topView.snp.top).offset(5)
            make.trailing.equalTo(topView.snp.trailing).offset(-5)
        }
    }
    
    func setUpQuestionLabel(){
        addSubview(questionLabel)
        questionLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(topView.snp.centerX)
            make.centerY.equalTo(topView.snp.centerY)
        }
    }
    
    func setUpSeeAnswerButton() {
        addSubview(seeAnswerButton)
        seeAnswerButton.snp.makeConstraints { (make) in
            make.trailing.equalTo(topView.snp.trailing).offset(-5)
            make.bottom.equalTo(topView.snp.bottom).offset(-5)
        }
    }
    
    func setUpBottomView() {
        addSubview(bottomView)
        bottomView.snp.makeConstraints { (make) in
            make.bottom.leading.trailing.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(safeAreaLayoutGuide).multipliedBy(0.5)
        }
    }
    
    func setUpAnswerLabel() {
        addSubview(answerLabel)
        answerLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(bottomView.snp.centerX)
            make.centerY.equalTo(bottomView.snp.centerY)
        }
    }
    
    func setUpNextQuestionButton() {
        addSubview(nextQuestionButton)
        nextQuestionButton.snp.makeConstraints { (make) in
            make.trailing.equalTo(bottomView.snp.trailing).offset(-5)
            make.bottom.equalTo(bottomView.snp.bottom).offset(-5)
        }
    }
    
    
    
    
    
    
    
    
    
    
}
