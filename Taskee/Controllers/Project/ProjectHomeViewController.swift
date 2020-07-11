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
        table.register(ProjectCell.self, forCellReuseIdentifier: ProjectCell.identifier)
        table.separatorStyle = UITableViewCell.SeparatorStyle.none
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Projects"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = .white
        setButton()
        setTable()
    }
    
    func setTable(){
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        tableView.rowHeight = 100
        tableView.backgroundColor = .white
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    //MARK: Button
    func setButton(){
        let newButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createProject))
        self.navigationItem.rightBarButtonItem = newButton
    }
    
    @objc func createProject(){
        print("Adding project")
        let addVC = NewerProjectViewController()
        self.navigationController?.pushViewController(addVC, animated: true)
    }
    
}

extension ProjectHomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProjectCell.identifier, for: indexPath) as! ProjectCell
//        let news = newsArts[indexPath.row]
        cell.colorTag.backgroundColor = .red
        cell.projectTitle.text = "Project Sneel"
        cell.taskLabel.text = "5 Tasks"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! ProjectCell
        let vc = TaskViewController()
        vc.projectTitle = cell.projectTitle.text ?? ""
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
