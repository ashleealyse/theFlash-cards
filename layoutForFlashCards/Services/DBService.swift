//
//  DBService.swift
//  layoutForFlashCards
//
//  Created by Ashlee Krammer on 2/20/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import Foundation
import FirebaseDatabase

@objc protocol DBServiceDelegate: class {
    @objc optional func didFailToAddCategory()
    @objc optional func didAddCategory()
    @objc optional func didAddCard()
    @objc optional func didFailToAddCard()
    
}

class DBService: NSObject {
    
    private override init() {
        
        rootRef = Database.database().reference()
        usersRef = rootRef.child("users")
        categoryRef = rootRef.child("categories")
        cardRef = rootRef.child("cards")
        super.init()
        
    }
    
    static let manager = DBService()
    
    var categories = [Category]()
    
    var cards = [Card]()
    
    
    var cardRef: DatabaseReference!
    var categoryRef: DatabaseReference!
    var rootRef: DatabaseReference!
    var usersRef: DatabaseReference!
    
    public weak var delegate: DBServiceDelegate?
    
    
    
    
}
