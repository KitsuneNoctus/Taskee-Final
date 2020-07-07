//
//  NewProjectViewController.swift
//  Taskee
//
//  Created by Henry Calderon on 6/29/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

class NewProjectViewController: UIViewController {
    
    let colors: [UIColor] = [UIColor(named: "softRed")!,UIColor(named: "almostPink")!,UIColor(named: "Lavender")!,UIColor(named: "SkyBlue")!,UIColor(named: "ForrestGreen")!,UIColor(named: "lightOrange")!,UIColor(named: "black")!,UIColor(named: "grey")!,UIColor(named: "lightGrey")!]
    
    //MARK: Buttons
    let color1: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        button.tintColor = UIColor(named: "softRed")
        button.tag = 0
        return button
    }()
    
    let color2: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        button.tintColor = UIColor(named: "almostPink")
        button.tag = 1
        return button
    }()
    
    let color3: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        button.tintColor = UIColor(named: "Lavender")
        button.tag = 2
        return button
    }()
    
    let color4: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        button.tintColor = UIColor(named: "SkyBlue")
        button.tag = 3
        return button
    }()
    
    let color5: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        button.tintColor = UIColor(named: "ForrestGreen")
        button.tag = 4
        return button
    }()
    
    let color6: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        button.tintColor = UIColor(named: "lightOrange")
        button.tag = 5
        return button
    }()
    
    let color7: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        button.tintColor = UIColor(named: "black")
        button.tag = 6
        return button
    }()
    
    let color8: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        button.tintColor = UIColor(named: "grey")
        button.tag = 7
        return button
    }()
    
    let color9: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        button.tintColor = UIColor(named: "lightGrey")
        button.tag = 8
        return button
    }()
    
    //MARK: Stacks
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
        buttonSetup()
    }
    
    
    //MARK: Setup
    func setup(){
        self.view.addSubview(nameInput)
        NSLayoutConstraint.activate([
            nameInput.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            nameInput.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            nameInput.trailingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10)
        ])
        
//        self.view.addSubview(vStack)
//        NSLayoutConstraint.activate([
//            vStack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//            vStack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
//        ])
//        vStack.addArrangedSubview(hStack1)
//        vStack.addArrangedSubview(hStack2)
//        vStack.addArrangedSubview(hStack3)
    }
    
    //MARK: Button Setup
    func buttonSetup(){
        hStack1.addArrangedSubview(color1)
        hStack1.addArrangedSubview(color2)
        hStack1.addArrangedSubview(color3)
        
        hStack2.addArrangedSubview(color4)
        hStack2.addArrangedSubview(color5)
        hStack2.addArrangedSubview(color6)
        
        hStack3.addArrangedSubview(color7)
        hStack3.addArrangedSubview(color8)
        hStack3.addArrangedSubview(color9)
    }
    
    
    //MARK: Saving
    @objc func saveProject(){
        print("Saving...")
    }
    
    @objc func selectColor(sender: UIButton!){
        let color = colors[sender.tag]
        print("Color is \(color)")
    }
    
}
