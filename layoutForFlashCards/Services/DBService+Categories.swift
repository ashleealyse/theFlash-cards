//
//  DBService+Categories.swift
//  layoutForFlashCards
//
//  Created by Ashlee Krammer on 2/20/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase


extension DBService {
    
    
    
    func addCategory(name: String){
        guard let currentUser = AuthUserService.getCurrentUser() else {print("could not get current user"); return}
        for cata in categories{
            if cata.name == name{
                self.delegate?.didFailToAddCategory!()
                return
            }
        }
        
        
        let ref = categoryRef.childByAutoId()
        let category = Category(name: name, uID: currentUser.uid)
        ref.setValue(["name": category.name,
                      "uID": category.uID,
                      ])
        self.delegate?.didAddCategory!()
    }
    
    public func getAllCategories(completion: @escaping (_ category: [Category]) -> Void) {
        categoryRef.observe(.value) { (dataSnapshot) in
            var categories = [Category]()
            guard let categorySnapshots = dataSnapshot.children.allObjects as? [DataSnapshot] else {
                return
            }
            for categorySnapshot in categorySnapshots {
                guard let categoryObject = categorySnapshot.value as? [String: Any] else {
                    return
                }
                
                guard let name = categoryObject["name"] as? String,
                    let uID = categoryObject["uID"] as? String
                    
                    else { print("error getting posts");return}
                
                let thisCategory = Category(name: name, uID: uID)
                categories.append(thisCategory)
                
            }
            let userId = AuthUserService.getCurrentUser()?.uid
            categories = categories.filter{ $0.uID == userId }
            DBService.manager.categories = categories
            completion(categories)
        }
    }
    
    
//    func getCurrentUserCategories() -> [Category] {
//        guard let userId = AuthUserService.getCurrentUser()?.uid else {print("cant get current users categories"); return []}
//        return categories.filter{ $0.uID ==  userId}
//    }
    
}
