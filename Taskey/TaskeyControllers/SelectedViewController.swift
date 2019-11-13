//
//  SelectedViewController.swift
//  Taskey
//
//  Created by Ali on 07.11.2019.
//  Copyright © 2019 Ali. All rights reserved.
//

import UIKit

class SelectedViewController: UIViewController {
    
    let importanceLabel: UIButton = {
        let label = UIButton()
        label.titleLabel!.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.titleLabel!.textAlignment = .center
        label.titleLabel!.textColor = .white
        label.layer.cornerRadius = 5
        return label
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
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 5
        return label
    }()
    
    let taskImage: UIImageView = {
        let image = UIImageView()
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
        textV.textAlignment = .center
        textV.font = UIFont.systemFont(ofSize: 17)
        textV.translatesAutoresizingMaskIntoConstraints = false
        textV.isEditable = false
        textV.isUserInteractionEnabled = false
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
        text.textAlignment = .left
        text.font = UIFont.systemFont(ofSize: 20)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.showsVerticalScrollIndicator = false
        text.isEditable = false
        return text
    }()
    

    var image: String?
    var importance: String?
    var titleTask: String?
    var detailTask: String?
    var taskNotification: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskImage.image = UIImage(named: image!)
        taskTitle.text = titleTask
        detailTextView.text = detailTask
        dateNotificationLabel.text = taskNotification
        
        if importance == "urgent" {
            importanceLabel.backgroundColor = .red
            importanceLabel.setTitle(importance, for: .normal)
        }
        else if importance == "important" {
            importanceLabel.backgroundColor = .purple
            importanceLabel.setTitle(importance, for: .normal)
        }
        else {
            importanceLabel.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
            importanceLabel.setTitle(importance, for: .normal)
        }

        
      setupView()
        
        
    }
    
    
    
    
    func setupView() {
        view.addSubview(importanceLabel)
        view.addSubview(taskImage)
        view.addSubview(taskTitle)
        view.addSubview(selectedNotificationLabel)
        view.addSubview(dateNotificationLabel)
        view.addSubview(detailTextView)
        view.addSubview(taskTitleLabel)
        view.addSubview(detailTaskLabel)
        
        importanceLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        importanceLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        importanceLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        importanceLabel.widthAnchor.constraint(equalToConstant: 90).isActive = true
        
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
        taskTitle.rightAnchor.constraint(equalTo: importanceLabel.rightAnchor).isActive = true
        
        selectedNotificationLabel.topAnchor.constraint(equalTo: taskTitle.bottomAnchor, constant: 10).isActive = true
        selectedNotificationLabel.leftAnchor.constraint(equalTo: taskTitle.leftAnchor).isActive = true
        selectedNotificationLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        selectedNotificationLabel.widthAnchor.constraint(equalToConstant: 140).isActive = true
        
//        dateNotificationLabel.topAnchor.constraint(equalTo: selectedNotificationLabel.topAnchor).isActive = true
        dateNotificationLabel.leftAnchor.constraint(equalTo: selectedNotificationLabel.rightAnchor, constant: 20).isActive = true
        dateNotificationLabel.heightAnchor.constraint(equalToConstant: 34).isActive = true
        dateNotificationLabel.widthAnchor.constraint(equalToConstant: 180).isActive = true
        dateNotificationLabel.centerYAnchor.constraint(equalTo: selectedNotificationLabel.centerYAnchor).isActive = true
        
        detailTaskLabel.topAnchor.constraint(equalTo: selectedNotificationLabel.bottomAnchor, constant: 20).isActive = true
        detailTaskLabel.leftAnchor.constraint(equalTo: selectedNotificationLabel.leftAnchor).isActive = true
        detailTaskLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        detailTaskLabel.widthAnchor.constraint(equalToConstant: 90).isActive = true
        
        detailTextView.topAnchor.constraint(equalTo: detailTaskLabel.bottomAnchor).isActive = true
        detailTextView.leftAnchor.constraint(equalTo: taskTitle.leftAnchor).isActive = true
        detailTextView.rightAnchor.constraint(equalTo: taskTitle.rightAnchor).isActive = true
        detailTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    }

}
