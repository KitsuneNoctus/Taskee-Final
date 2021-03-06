//
//  ProjectHomeViewController.swift
//  Taskee
//
//  Created by Henry Calderon on 6/29/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

class ProjectHomeViewController: UIViewController {
    
    lazy var coreDataStack = CoreDataStack()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .clear
        table.register(ProjectCell.self, forCellReuseIdentifier: ProjectCell.identifier)
        table.separatorStyle = UITableViewCell.SeparatorStyle.none
        return table
    }()
    
    //MARK: Fetch Controller
    lazy var fetchedResultsController: NSFetchedResultsController<Project> = {
        
        let fetchRequest: NSFetchRequest<Project> = Project.fetchRequest()
        fetchRequest.sortDescriptors = []
        
        let fetchedResultsController = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: coreDataStack.managedContext,
            sectionNameKeyPath: nil,
            cacheName: nil)
        
        fetchRequest.delegate = self
        
        return fetchedResultsController
    }()
    
    //MARK: View Did Load
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
        let addVC = AddProjectViewController()
        self.navigationController?.pushViewController(addVC, animated: true)
    }
    
}

//MARK: Extension - Configure Cell
extension ProjectHomeViewController{
    func configure(cell: UITableViewCell, for indexPath: IndexPath){
        guard let cell = cell as? ProjectCell else { return }
        let project = fetchedResultsController.object(at: indexPath)
        
        call.projectTitle.text = project.title
        
//        cell.projectTitle.text = project
    }
}

//MARK: Table Delegate & Data Source
extension ProjectHomeViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
      //sections
      return fetchedResultsController.sections?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //rows
      guard let sectionInfo =
        fetchedResultsController.sections?[section] else {
          return 0
      }
      
      return sectionInfo.numberOfObjects
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProjectCell.identifier, for: indexPath) as! ProjectCell
//        let news = newsArts[indexPath.row]
//        cell.colorTag.backgroundColor = .red
//        cell.projectTitle.text = "Project Sneel"
//        cell.taskLabel.text = "5 Tasks"
        configure(cell: cell, for indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! ProjectCell
        let vc = TaskViewController()
        vc.projectTitle = cell.projectTitle.text ?? ""
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

//MARK: Fetched Results Controller
extension ProjectHomeViewController: NSFetchedResultsControllerDelegate{
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
      tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,
                    didChange anObject: Any,
                    at indexPath: IndexPath?,
                    for type: NSFetchedResultsChangeType,
                    newIndexPath: IndexPath?) {
      
      switch type {
      case .insert:
        tableView.insertRows(at: [newIndexPath!], with: .automatic)
      case .delete:
        tableView.deleteRows(at: [indexPath!], with: .automatic)
      case .update:
        let cell = tableView.cellForRow(at: indexPath!) as! TeamCell
        configure(cell: cell, for: indexPath!)
      case .move:
        tableView.deleteRows(at: [indexPath!], with: .automatic)
        tableView.insertRows(at: [newIndexPath!], with: .automatic)
      }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
      tableView.endUpdates()
    }
}
