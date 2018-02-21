//
//  CreateCardView.swift
//  layoutForFlashCards
//
//  Created by Ashlee Krammer on 2/17/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import UIKit

class CreateCardView: UIView {

    //LS - Cancel Button
    //Category Picker
    //Question
    //Answer
    //Create Card Button
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "cancel"), for: .normal)
        return button
    }()
    
    lazy var newCardLabel: UILabel = {
        let label = UILabel()
        label.text = "newFlashCard"
        label.textAlignment = .center
        label.textColor = .magenta
        return label
    }()
    
    lazy var questionTF: UITextField = {
        let qF = UITextField()
        qF.placeholder = "addAQuestion"
        qF.borderStyle = .roundedRect
        qF.layer.borderWidth = 1.0
        qF.layer.borderColor = UIColor.magenta.cgColor
        return qF
    }()
    
    lazy var answerTF: UITextField = {
        let aF = UITextField()
        aF.placeholder = "addAnAnswer"
        aF.borderStyle = .roundedRect
        aF.layer.borderWidth = 1.0
        aF.layer.borderColor = UIColor.magenta.cgColor

        return aF
    }()
    
//    lazy var categoryPicker: UIPickerView = {
//       let cP = UIPickerView()
//        cP.layer.borderWidth = 1.0
//        cP.layer.borderColor = UIColor.magenta.cgColor
//        cP.layer.backgroundColor = UIColor.purple.cgColor
//        return cP
//    }()
    
    lazy var submitButton: UIButton = {
       let sB = UIButton()
        sB.setTitle("submitCard", for: .normal)
        sB.setTitleColor(.magenta, for: .normal)
        return sB
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUpViews() {
        setUpCancelButton()
        setUpNewCardLabel()
        setUpQuestionTF()
        setUpAnswerTF()
//        setUpCategoryPicker()
        setUpSubmitButton()
    }
    
    func setUpCancelButton() {
        addSubview(cancelButton)
        cancelButton.snp.makeConstraints { (make) in
            make.top.leading.equalTo(safeAreaLayoutGuide).offset(10)
        }
    }
    
    func setUpNewCardLabel() {
        addSubview(newCardLabel)
        newCardLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(cancelButton).offset(5)
            make.trailing.equalTo(safeAreaLayoutGuide).offset(-5)
            make.top.equalTo(safeAreaLayoutGuide).offset(25)
        }
    }
    
    func setUpQuestionTF() {
        addSubview(questionTF)
        questionTF.snp.makeConstraints { (make) in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(cancelButton.snp.bottom).offset(35)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
        
    }
    
    func setUpAnswerTF() {
        addSubview(answerTF)
        answerTF.snp.makeConstraints { (make) in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(questionTF.snp.bottom).offset(20)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
    }
    
//    func setUpCategoryPicker() {
//        addSubview(categoryPicker)
//        categoryPicker.snp.makeConstraints { (make) in
//            make.top.equalTo(answerTF.snp.bottom).offset(20)
//            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
//            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
//            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
//            make.height.equalTo(safeAreaLayoutGuide).multipliedBy(0.4)
//        }
//    }
    
    func setUpSubmitButton() {
        addSubview(submitButton)
        submitButton.snp.makeConstraints { (make) in
            make.top.equalTo(answerTF.snp.bottom).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-10)
        }
        
    }
    
    
}
