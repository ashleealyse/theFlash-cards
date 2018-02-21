//
//  AppUser.swift
//  layoutForFlashCards
//
//  Created by Ashlee Krammer on 2/20/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import Foundation
class AppUser: NSObject {
    
    var uID: String
    var email: String
    
    init(email: String, uID:String) {
        self.email = email
        self.uID = uID
    }
    
}
