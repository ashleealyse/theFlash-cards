//
//  ProfileView.swift
//  layoutForFlashCards
//
//  Created by Ashlee Krammer on 2/17/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import UIKit

class ProfileView: UIView {

    lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "user")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var usernameTextField: UITextField = {
        let tf = UITextField()
        tf.layer.borderColor = UIColor.white.cgColor
        tf.layer.borderWidth = 1.0
        tf.borderStyle = .roundedRect
        tf.text = "ashleeTheAmazing"
        tf.isEnabled = false
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.layer.borderColor = UIColor.white.cgColor
        tf.layer.borderWidth = 1.0
        tf.borderStyle = .roundedRect
        tf.text = "ashleeTheAmazing"
        tf.isSecureTextEntry = true
        tf.isEnabled = false
        return tf
    }()
    
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Score: 0"
//        label.textColor = .white
        return label
    }()
    
    lazy var signOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("signOut", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.white.cgColor
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
        setUpLogo()
        setUpUsernameTF()
        setUpPasswordTF()
        setUpScoreLabel()
        setUpSignOutButton()
    }
    
    func setUpLogo() {
        addSubview(logoImage)
        logoImage.snp.makeConstraints { (make) in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(35)
            make.height.width.equalTo(safeAreaLayoutGuide).multipliedBy(0.25)
        }
    }
    
    func setUpUsernameTF() {
        addSubview(usernameTextField)
        usernameTextField.snp.makeConstraints { (make) in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(logoImage.snp.bottom).offset(20)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
            
        }
    }
    
    func setUpPasswordTF() {
        addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { (make) in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(usernameTextField.snp.bottom).offset(20)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
            
        }
    }

    func setUpScoreLabel() {
        addSubview(scoreLabel)
        scoreLabel.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
    }
    
    func setUpSignOutButton() {
        addSubview(signOutButton)
        signOutButton.snp.makeConstraints { (make) in
            make.top.equalTo(scoreLabel.snp.bottom).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
    }

}
