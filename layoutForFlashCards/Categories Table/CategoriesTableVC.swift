//
//  CategoriesTableVC.swift
//  layoutForFlashCards
//
//  Created by Ashlee Krammer on 2/17/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import UIKit

class CategoriesTableVC: UIViewController {

    //Variables
    var categoriesTableView = CategoriesTableView()
    
    //View Did Load 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(categoriesTableView)
        view.backgroundColor = .purple
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
            
            //TODO: add this category to the table of categories
    
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }

}

extension CategoriesTableVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected Row \(indexPath.row)")
//        let  = venues[indexPath.row]
        let cell = tableView.cellForRow(at: indexPath)
        let flashCards = QuestionCardVC()
        flashCards.modalTransitionStyle = .crossDissolve
        flashCards.modalPresentationStyle = .overCurrentContext
//        navigationController?.pushViewController(flashCards, animated: true)
        navigationController?.present(flashCards, animated: true, completion: nil)
        
        present(flashCards, animated: true, completion: nil)
    }
    
}

extension CategoriesTableVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = "DSA Questions"
        cell.textLabel?.textColor = .purple
        return cell
    }
    
    
}
