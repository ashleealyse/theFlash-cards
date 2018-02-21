//
//  CategoriesTableView.swift
//  layoutForFlashCards
//
//  Created by Ashlee Krammer on 2/17/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import UIKit
import SnapKit

class CategoriesTableView: UIView {
    
    //Inside Tab Bar
    //RS - Addition Button (Opens pop up to add category)
    //Table View with all Categories

    lazy var addCategoryButton: UIButton = {
       let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "add"), for: .normal)
        return button
    }()
    
    lazy var tableView: UITableView = {
       let tv = UITableView()
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUpViews() {
        setUpAddCategoryButton()
        setUpCategoryTable()
    }
    
    func setUpAddCategoryButton() {
        addSubview(addCategoryButton)
        addCategoryButton.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(8)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-8)
            make.height.width.equalTo(safeAreaLayoutGuide).multipliedBy(0.05)
        }
    }
    
    func setUpCategoryTable() {
        addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(addCategoryButton.snp.bottom).offset(5)
            make.trailing.leading.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
}
