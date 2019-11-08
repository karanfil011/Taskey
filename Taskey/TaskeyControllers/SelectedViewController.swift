//
//  SelectedViewController.swift
//  Taskey
//
//  Created by Ali on 07.11.2019.
//  Copyright © 2019 Ali. All rights reserved.
//

import UIKit

class SelectedViewController: UIViewController {
    
    let importanceButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("urgent", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    let taskTitleLabel: UILabel = {
        let title = UILabel()
        title.text = "Task title:"
        title.textColor = .gray
        title.font = UIFont.systemFont(ofSize: 17)
        title.textAlignment = .left
        title.translatesAutoresizingMaskIntoConstraints = false
        
        return title
    }()

    
    let taskTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "Drive to airport to meet John"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 5
        return label
    }()
    
    let taskImage: UIImageView = {
        let image = UIImageView()
//        image.backgroundColor = .yellow
        image.image = UIImage(named: "car")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let selectedNotificationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Notification:"
        return label
    }()
    
    let dateNotificationLabel: UITextView = {
        let textV = UITextView()
        textV.layer.borderColor = UIColor.lightGray.cgColor
        textV.layer.borderWidth = 1
        textV.layer.cornerRadius = 5
        textV.text = "10.01.2019"
        textV.textAlignment = .center
        textV.font = UIFont.systemFont(ofSize: 17)
        textV.translatesAutoresizingMaskIntoConstraints = false
        return textV
    }()
    
    let detailTaskLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "Detail:"
        label.textColor = .gray
        return label
    }()
    
    let detailTextView: UITextView = {
        let text = UITextView()
        text.text = "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?"
        text.textAlignment = .left
        text.font = UIFont.systemFont(ofSize: 20)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.isScrollEnabled = false
        return text
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

      setupView()
        
        
    }
    
    
    func setupView() {
        view.addSubview(importanceButton)
        view.addSubview(taskImage)
        view.addSubview(taskTitle)
        view.addSubview(selectedNotificationLabel)
        view.addSubview(dateNotificationLabel)
        view.addSubview(detailTextView)
        view.addSubview(taskTitleLabel)
        view.addSubview(detailTaskLabel)
        
        importanceButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        importanceButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        importanceButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        importanceButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
        
        taskImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        taskImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        taskImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        taskImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        taskTitleLabel.topAnchor.constraint(equalTo: taskImage.bottomAnchor, constant: 20).isActive = true
        taskTitleLabel.leftAnchor.constraint(equalTo: taskImage.leftAnchor).isActive = true
        taskTitleLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        taskTitleLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        taskTitle.topAnchor.constraint(equalTo: taskTitleLabel.bottomAnchor).isActive = true
        taskTitle.leftAnchor.constraint(equalTo: taskTitleLabel.leftAnchor, constant: 3).isActive = true
        taskTitle.heightAnchor.constraint(equalToConstant: 40).isActive = true
        taskTitle.rightAnchor.constraint(equalTo: importanceButton.rightAnchor).isActive = true
        
        selectedNotificationLabel.topAnchor.constraint(equalTo: taskTitle.bottomAnchor, constant: 10).isActive = true
        selectedNotificationLabel.leftAnchor.constraint(equalTo: taskTitle.leftAnchor).isActive = true
        selectedNotificationLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        selectedNotificationLabel.widthAnchor.constraint(equalToConstant: 140).isActive = true
        
//        dateNotificationLabel.topAnchor.constraint(equalTo: selectedNotificationLabel.topAnchor).isActive = true
        dateNotificationLabel.leftAnchor.constraint(equalTo: selectedNotificationLabel.rightAnchor, constant: 20).isActive = true
        dateNotificationLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        dateNotificationLabel.widthAnchor.constraint(equalToConstant: 140).isActive = true
        dateNotificationLabel.centerYAnchor.constraint(equalTo: selectedNotificationLabel.centerYAnchor).isActive = true
        
        detailTaskLabel.topAnchor.constraint(equalTo: selectedNotificationLabel.bottomAnchor, constant: 20).isActive = true
        detailTaskLabel.leftAnchor.constraint(equalTo: selectedNotificationLabel.leftAnchor).isActive = true
        detailTaskLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        detailTaskLabel.widthAnchor.constraint(equalToConstant: 90).isActive = true
        
        detailTextView.topAnchor.constraint(equalTo: detailTaskLabel.bottomAnchor).isActive = true
        detailTextView.leftAnchor.constraint(equalTo: taskTitle.leftAnchor).isActive = true
        detailTextView.rightAnchor.constraint(equalTo: taskTitle.rightAnchor).isActive = true
        detailTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
    }

}
