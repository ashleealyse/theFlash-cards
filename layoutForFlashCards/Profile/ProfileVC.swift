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

    //View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(profileView)
//        view.addSubview(checkView)
        profileView.signOutButton.addTarget(self, action: #selector(signOut), for: .touchUpInside)
    }

    @objc private func signOut() {
        //TODO: sign user out and return to sign in page
        present(loginVC, animated: true, completion: nil)
    }

}
