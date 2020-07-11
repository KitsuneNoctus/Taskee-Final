//
//  TaskViewController.swift
//  Taskee
//
//  Created by Henry Calderon on 6/29/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController {
    var projectTitle: String = "Project Name"
    
    let todoSelector: UISegmentedControl = {
        let control = UISegmentedControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.backgroundColor = .systemGreen
        return control
    }()
    
    let taskTable: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .clear
        table.register(TasksCell.self, forCellReuseIdentifier: TasksCell.identifier)
//        table.separatorStyle = UITableViewCell.SeparatorStyle.none
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = projectTitle
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Task", style: .plain, target: self, action: #selector(addTask))
        setupControl()
        setupTable()
        
    }
    
    //MARK: Setup
    func setupTable(){
        taskTable.delegate = self
        taskTable.dataSource = self
        self.view.addSubview(taskTable)
        NSLayoutConstraint.activate([
            taskTable.topAnchor.constraint(equalTo: self.todoSelector.bottomAnchor, constant: 20),
            taskTable.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            taskTable.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            taskTable.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    func setupControl(){
        todoSelector.insertSegment(withTitle: "TODO", at: 0, animated: true)
        todoSelector.insertSegment(withTitle: "DONE", at: 1, animated: true)
        todoSelector.selectedSegmentIndex = 0
        self.view.addSubview(todoSelector)
        NSLayoutConstraint.activate([
            todoSelector.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            todoSelector.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            todoSelector.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            todoSelector.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    //MARK: @OBJC
    @objc func addTask(){
        navigationController?.pushViewController(NewEditTaskViewController(), animated: true)
    }

}

extension TaskViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TasksCell.identifier, for: indexPath) as! TasksCell
//        cell.textLabel?.text = "Hello"
        print(cell)
        cell.taskLabel.text = "Hello"
//        if todoSelector.selectedSegmentIndex == 0{
//            
//        }else{
//            
//        }
        return cell
    }
    
    
}
