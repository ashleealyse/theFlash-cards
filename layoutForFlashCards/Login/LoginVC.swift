//
//  LoginViewController.swift
//  layoutForFlashCards
//
//  Created by Ashlee Krammer on 2/17/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
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
            AuthUserService.manager.signIn(withEmail: loginView.usernameTextField.text!, password: loginView.passwordTextField.text!)
        }
        
    }
    
    @objc private func newAccount() {
        dismiss(animated: true, completion: nil)
        present(newAccountVC, animated: false, completion: nil)

    }
    
}


extension LoginVC: AuthUserServiceDelegate {
    
    func didFailSigningIn(_ userService: AuthUserService, error: Error) {
        print(error.localizedDescription)
        let alert = UIAlertController(title: "Could Not Login", message: "Try Connecting To Wifi", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func didSignIn(_ userService: AuthUserService, user: AppUser) {
    
        let tbc = UITabBarController()
        let cat = CategoriesTableVC()
        cat.tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "cards"), tag: 0)
        let prf = ProfileVC()
        prf.tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "user"), tag: 1)
        tbc.viewControllers = [cat, prf]
        
        present(tbc, animated: true, completion: nil)
    }
    
}
