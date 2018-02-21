//
//  CreateAccountView.swift
//  layoutForFlashCards
//
//  Created by Ashlee Krammer on 2/17/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import UIKit

class CreateAccountView: UIView {

    //Logo
    //In Nav Controller from log in view
    //Email Text Field
    //Username Text Field
    //Password Text Field
    //Password Text Field
    //Create Account Button
    
    lazy var cancelButton: UIButton = {
       let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "cancel"), for: .normal)
        return button
    }()
    
    lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "user")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.layer.borderColor = UIColor.white.cgColor
        tf.layer.borderWidth = 1.0
        tf.borderStyle = .roundedRect
        tf.placeholder = "emailAddress"
        return tf
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
        tf.isSecureTextEntry = true
        tf.placeholder = "password"
        return tf
    }()
    
    lazy var passwordCheckTextField: UITextField = {
        let tf = UITextField()
        tf.layer.borderColor = UIColor.white.cgColor
        tf.layer.borderWidth = 1.0
        tf.borderStyle = .roundedRect
        tf.isSecureTextEntry = true
        tf.placeholder = "password"
        return tf
    }()
    
    
    lazy var newAccountButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("createAccount", for: .normal)
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
        setUpCancelButton()
        setUpLogo()
        setUpEmailTF()
        setUpUsernameTF()
        setUpPasswordTF()
        setUpPassCheckTF()
        setUpNewAccountButton()
    }
    
    func setUpCancelButton() {
        addSubview(cancelButton)
        cancelButton.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(5)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(5)
        }
    }
    
    func setUpLogo() {
        addSubview(logoImage)
        logoImage.snp.makeConstraints { (make) in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(35)
            make.height.width.equalTo(safeAreaLayoutGuide).multipliedBy(0.25)
        }
    }
    
    func setUpEmailTF() {
        addSubview(emailTextField)
        emailTextField.snp.makeConstraints { (make) in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(logoImage.snp.bottom).offset(20)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
            
        }
    }
    
    func setUpUsernameTF() {
        addSubview(usernameTextField)
        usernameTextField.snp.makeConstraints { (make) in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
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
    
    func setUpPassCheckTF() {
        addSubview(passwordCheckTextField)
        passwordCheckTextField.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
    }
    
    
    func setUpNewAccountButton() {
        addSubview(newAccountButton)
        newAccountButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordCheckTextField.snp.bottom).offset(20)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
    }
}
