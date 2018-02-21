//
//  LoginViewController.swift
//  layoutForFlashCards
//
//  Created by Ashlee Krammer on 2/17/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, AuthUserServiceDelegate {
    
    //Variables
    var loginView = LoginView()
    var securePassCounter = 0
    var newAccountVC = CreateAccountVC()
    let currentUser = AuthUserService.getCurrentUser()
    
    //View Did Load 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginView)
        AuthUserService.manager.delegate = self
        loginView.showPassowrdButton.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
        loginView.logInButton.addTarget(self, action: #selector(logIn), for: .touchUpInside)
        loginView.newAccountButton.addTarget(self, action: #selector(newAccount), for: .touchUpInside)
    }

    @objc private func showPassword() {
       print(securePassCounter = securePassCounter + 1)
        
        if securePassCounter % 2 == 1 {
            loginView.showPassowrdButton.setImage(#imageLiteral(resourceName: "lock"), for: .normal)
            loginView.passwordTextField.isSecureTextEntry = false
        } else {
            loginView.showPassowrdButton.setImage(#imageLiteral(resourceName: "unlock"), for: .normal)
            loginView.passwordTextField.isSecureTextEntry = true
        }
    }
    
    @objc private func logIn() {
        
        //Check if fields are empty
        if loginView.usernameTextField.text == "" || loginView.passwordTextField.text == "" {
            let alert = UIAlertController(title: "One Or More Fields Left Blank ", message: "Complete All Fields", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            }))
            self.present(alert, animated: true, completion: nil)
        } else  {
            print("trying to sign in")
                    AuthUserService.manager.signIn(withEmail: loginView.usernameTextField.text!, password: loginView.passwordTextField.text!)
        }
//        //TODO: Check if email exists in userbase
//        //If email doesn't exist in userbase, present alert
//        else if loginView.usernameTextField.text != "userNameInUserBase" {
//        let alert = UIAlertController(title: "Username Doesn't Exist ", message: "Try Again || Create Account...", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
//        }))
//        self.present(alert, animated: true, completion: nil)
//        }
//        //TODO: Check if password matches that email
//        //If password doesnt match that email, present alert
//            else if loginView.passwordTextField.text != "matchUsernamePass" {
//            loginView.passwordTextField.textColor = .red
//        let alert = UIAlertController(title: "Password Doesn't Match Username ", message: "Try Again...", preferredStyle: .alert)
//
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
//            self.loginView.passwordTextField.textColor = .black
//        }))
//        self.present(alert, animated: true, completion: nil)
//
//            } else {
//                //TODO: Sign user in
//            }
    }
    
    @objc private func newAccount() {
        present(newAccountVC, animated: false, completion: nil)
    }

}

