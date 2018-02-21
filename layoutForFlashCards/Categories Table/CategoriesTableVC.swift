//
//  CategoriesTableVC.swift
//  layoutForFlashCards
//
//  Created by Ashlee Krammer on 2/17/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import UIKit
//Step 1: (for custom delegation)
//create custom protocol in obj fo opt.

//Step 2: Create events (things you want to signal)

//Step 3: Create delegate variable

//Step 4: Find places you want to call the alert (sending signal)
@objc protocol CategoriesTableVCDelegate: class {
    
    @objc optional func didSegue(category: String)
    
}

class CategoriesTableVC: UIViewController {

    
    //Variables
    var categoriesTableView = CategoriesTableView()
    public weak var delegate: CategoriesTableVCDelegate?
    var categories = [Category]() {
        didSet {
        categoriesTableView.tableView.reloadData()
        }
    }
    
    //View Did Load 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(categoriesTableView)
        DBService.manager.delegate = self
        view.backgroundColor = .purple
        DBService.manager.getAllCategories { (currentUsersCategories) in
            self.categories = currentUsersCategories
            
        }
        categoriesTableView.tableView.delegate = self
        categoriesTableView.tableView.dataSource = self
        categoriesTableView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CategoryCell")
        categoriesTableView.addCategoryButton.addTarget(self, action: #selector(addCategory), for: .touchUpInside)
    }

    @objc private func addCategory() {
        
        let alert = UIAlertController(title: "New Category ", message: "", preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = ""
        }
        
        // 3. Grab the value from the text field, and print it when the user clicks Add.
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
                            print("Text field: \(textField?.text)")
            DBService.manager.addCategory(name: (textField?.text)!)
            //TODO: check for nil
    
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }

}

extension CategoriesTableVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Selected Row \(indexPath.row)")
        let cell = tableView.cellForRow(at: indexPath)
        let thisCategory = categories[indexPath.row]
        let flashCards = QuestionCardVC(category: thisCategory.name)
        flashCards.modalTransitionStyle = .crossDissolve
        flashCards.modalPresentationStyle = .overCurrentContext
        present(flashCards, animated: true) {

        }
    }
    
}

extension CategoriesTableVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        let thisCategory = categories[indexPath.row]
        cell.textLabel?.text = thisCategory.name
        cell.textLabel?.textColor = .purple
        return cell
    }
    
    
}

extension CategoriesTableVC: DBServiceDelegate {
    
    func didAddCategory() {
        print("yay you added a category")
    }
    
    func didFailToAddCategory() {
        print("you failed at adding a category")
    }
    
    
}
