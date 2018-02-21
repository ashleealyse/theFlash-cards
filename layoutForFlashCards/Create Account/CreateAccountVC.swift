//
//  CreateAccountVC.swift
//  layoutForFlashCards
//
//  Created by Ashlee Krammer on 2/17/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    
    //Variables
    var createAccountView = CreateAccountView()
    
    //View Did Load 
    override func viewDidLoad() {
        super.viewDidLoad()
        AuthUserService.manager.delegate = self 
        view.addSubview(createAccountView)
        createAccountView.cancelButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        createAccountView.newAccountButton.addTarget(self, action: #selector(createAccount), for: .touchUpInside)
    }
    
    @objc private func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func createAccount() {
        //TODO: Create account
        //TODO: set user to user and view will change
        
        //Check if any field is empty
        if createAccountView.emailTextField.text == "" || createAccountView.usernameTextField.text == "" || createAccountView.passwordCheckTextField.text == "" || createAccountView.passwordTextField.text == "" {
            let alert = UIAlertController(title: "One Or More Fields Left Empty ", message: "Try Again...", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                self.createAccountView.passwordTextField.textColor = .black
                self.createAccountView.passwordCheckTextField.textColor = .black
            }))
            
            self.present(alert, animated: true, completion: nil)
            
            //Check if passwords match
            //If not:
        } else if createAccountView.passwordTextField.text != createAccountView.passwordCheckTextField.text {
            
            createAccountView.passwordTextField.textColor = .red
            createAccountView.passwordCheckTextField.textColor = .red
            
            
            let alert = UIAlertController(title: "Passwords Dont Match ", message: "Try Again...", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                
                self.createAccountView.passwordTextField.textColor = .black
                self.createAccountView.passwordCheckTextField.textColor = .black
            }))
            
            self.present(alert, animated: true, completion: nil)
            
            //If All requirements are met
        }         else if createAccountView.passwordTextField.text == createAccountView.passwordCheckTextField.text {
                createAccountView.newAccountButton.isEnabled = true
                dismiss(animated: true, completion: nil)

            AuthUserService.manager.createUser(withEmail: createAccountView.emailTextField.text!, password: createAccountView.passwordTextField.text!)
            
            }
            
        }
        
    }

extension CreateAccountVC: AuthUserServiceDelegate {
    
    func didCreateUser(_ userService: AuthUserService, user: AppUser) {
        print("User Created")
    }
    
    func didFailCreatingUser(_ userService: AuthUserService, error: Error) {
        print("Did not create user")
        print(error.localizedDescription)
    }
    
}
