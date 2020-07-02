//
//  ProjectHomeViewController.swift
//  Taskee
//
//  Created by Henry Calderon on 6/29/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

class ProjectHomeViewController: UIViewController {
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .clear
//        table.
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Projects"
        self.view.backgroundColor = .white
        setButton()
        setTable()
    }
    
    func setTable(){
        
    }
    
    //MARK: Button
    func setButton(){
        let newButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createProject))
        self.navigationItem.rightBarButtonItem = newButton
    }
    
    @objc func createProject(){
        print("Adding project")
//        let addVC = AddingItemViewController()
//        self.navigationController?.pushViewController(addVC, animated: true)
    }
    

}
