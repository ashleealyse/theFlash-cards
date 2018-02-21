//
//  DBService+AppUser.swift
//  layoutForFlashCards
//
//  Created by Ashlee Krammer on 2/20/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import Foundation
import FirebaseDatabase

extension DBService {
    public func addAppUser(_ appUser: AppUser) {
        let ref = usersRef.child(appUser.uID)
        ref.setValue(["email": appUser.email,
                      "uID": appUser.uID,
                      ])
        
    }
    
    func getAppUser(with uID: String, completion: @escaping (_ user: AppUser) -> Void) {
        let userRef = usersRef.child(uID)
        
        userRef.observeSingleEvent(of: .value) { (snapshot) in
            guard let email = snapshot.childSnapshot(forPath: "email").value as? String else {return}
            let currentAppUser = AppUser(email: email, uID: uID)
            completion(currentAppUser)
        }
    }
}
