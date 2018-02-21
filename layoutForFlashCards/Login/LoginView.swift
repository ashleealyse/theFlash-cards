//
//  LoginView.swift
//  layoutForFlashCards
//
//  Created by Ashlee Krammer on 2/17/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import UIKit

class LoginView: UIView {

    //Logo
    //Username Text Field
    //Password Text Field //Show Password Button
    //Sign In Button
    //Create Account Button 
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
        tf.placeholder = "username"
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.layer.borderColor = UIColor.white.cgColor
        tf.layer.borderWidth = 1.0
        tf.borderStyle = .roundedRect
        tf.placeholder = "password"
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var showPassowrdButton: UIButton = {
    let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "unlock"), for: .normal)
        return button
    }()
    
    lazy var logInButton: UIButton = {
        let button = UIButton()
       button.setTitleColor(.white, for: .normal)
        button.setTitle("logIn", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1.0
        return button
    }()
    
    lazy var newAccountButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("newAccount", for: .normal)
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
        setUpLogo()
        setUpUsernameTF()
        setUpPasswordTF()
        setUpShowPassButton()
        setUpLogInButton()
        setUpNewAccountButton()
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
    
    func setUpShowPassButton() {
        addSubview(showPassowrdButton)
        showPassowrdButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp.top).offset(1)
            make.trailing.equalTo(passwordTextField.snp.trailing).offset(-1)
            make.bottom.equalTo(passwordTextField.snp.bottom).offset(-1)
        }
    }
    
    func setUpLogInButton() {
        addSubview(logInButton)
        logInButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
    }
    
    func setUpNewAccountButton() {
        addSubview(newAccountButton)
        newAccountButton.snp.makeConstraints { (make) in
            make.top.equalTo(logInButton.snp.bottom).offset(20)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
    }
}
