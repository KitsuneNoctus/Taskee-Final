//
//  NewProjectViewController.swift
//  Taskee
//
//  Created by Henry Calderon on 6/29/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

class NewProjectViewController: UIViewController {
    
    let hStack1: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.spacing = 30
        return stack
    }()
    
    let hStack2: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.spacing = 30
        return stack
    }()
    
    let hStack3: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.spacing = 30
        return stack
    }()
    
    let vStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.spacing = 30
        return stack
    }()
    
    let colors: [UIColor] = [UIColor(named: "softRed")!,UIColor(named: "almostPink")!,UIColor(named: "Lavender")!,UIColor(named: "SkyBlue")!,UIColor(named: "ForrestGreen")!,UIColor(named: "lightOrange")!,UIColor(named: "black")!,UIColor(named: "grey")!,UIColor(named: "lightGrey")!]
    
    let nameInput: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Name Your Project..."
        return text
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New Project or Edit"
        self.view.backgroundColor = .white
        
        let saveButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(saveProject))
        self.navigationItem.rightBarButtonItem = saveButton
        
        setup()
    }
    
    
    //MARK: Setup
    func setup(){
        self.view.addSubview(nameInput)
        NSLayoutConstraint.activate([
            nameInput.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            nameInput.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            nameInput.trailingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10)
        ])
        
        self.view.addSubview(vStack)
        NSLayoutConstraint.activate([
            vStack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            vStack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        vStack.addArrangedSubview(hStack1)
        vStack.addArrangedSubview(hStack2)
        vStack.addArrangedSubview(hStack3)
    }
    
    //MARK: Button Setup
    
    
    //MARK: Saving
    @objc func saveProject(){
        print("Saving...")
    }
    
}
