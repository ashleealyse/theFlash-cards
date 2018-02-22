//
//  ProfileVC.swift
//  layoutForFlashCards
//
//  Created by Ashlee Krammer on 2/17/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    //Variables 
    var profileView = ProfileView()
    var loginVC = LoginVC()
    let currentUser = AuthUserService.getCurrentUser()
    //View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        AuthUserService.manager.delegate = self 
        view.addSubview(profileView)
        profileView.usernameTextField.text = "yourEmail: \(currentUser?.email)"
        profileView.signOutButton.addTarget(self, action: #selector(signOut), for: .touchUpInside)
    }

    @objc private func signOut() {
        AuthUserService.manager.signOut()
        print("You're pressing the sign out button")
    }

}

extension ProfileVC: AuthUserServiceDelegate {
    func didSignOut(_ userService: AuthUserService) {
        print("User Signed Out")
    present(loginVC, animated: true, completion: nil)
    }
}
