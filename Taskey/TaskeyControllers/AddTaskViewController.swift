//
//  AddTaskViewController.swift
//  Taskey
//
//  Created by Ali on 05.11.2019.
//  Copyright © 2019 Ali. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    let taskTitleLabel: UILabel = {
        let title = UILabel()
        title.text = "Task title"
        title.font = UIFont.systemFont(ofSize: 17)
        title.textAlignment = .left
        title.translatesAutoresizingMaskIntoConstraints = false
        
        return title
    }()

    let textTitleView: UITextView = {
        let titleText = UITextView()
        titleText.text = "Run 30 km"
        titleText.textColor = .lightGray
        titleText.translatesAutoresizingMaskIntoConstraints = false
        titleText.font = UIFont.systemFont(ofSize: 20)
        titleText.isScrollEnabled = false
        return titleText
    }()

    let chooseIconLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose Icon"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    let taskCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.allowsSelection = true
        cv.backgroundColor = .white
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    // font 15
    let urgentButton: UIButton = {
        let button = UIButton()
        button.setTitle("urgent", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowOpacity = 0.5
        button.layer.cornerRadius = 5
        return button
    }()
    // font 15
    let importantButton: UIButton = {
        let button = UIButton()
        button.setTitle("important", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowOpacity = 0.5
        button.layer.cornerRadius = 5
        return button
    }()
    // font 15
    let notMuchButton: UIButton = {
        let button = UIButton()
        button.setTitle("not much", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowOpacity = 0.5
        button.layer.cornerRadius = 5
        return button
    }()

    let notificationLabel: UILabel = {
        let label = UILabel()
        label.text = "Notification:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    let dateTextView: UITextView = {
        let date = UITextView()
        date.translatesAutoresizingMaskIntoConstraints = false
        date.font = UIFont.systemFont(ofSize: 14)
        date.textColor = .black
        date.layer.borderColor = UIColor.lightGray.cgColor
        date.layer.borderWidth = 1
        date.text = "20.01.2020"
        date.textAlignment = .center
        date.layer.cornerRadius = 5
        return date
    }()
    
    let detailTaskLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "Detail:"
        label.textColor = .black
        return label
    }()
    
    let detailTextView: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Write here..."
        text.textColor = .lightGray
        text.font = UIFont.systemFont(ofSize: 20)
        return text
    }()
    
    let cellId = "cellId"
    
    let taskIcons = [
    
        UIImage(named: "book"),
        UIImage(named: "car"),
        UIImage(named: "cash"),
        UIImage(named: "company"),
        UIImage(named: "guitar"),
        UIImage(named: "glases"),
        UIImage(named: "carpool"),
        UIImage(named: "family"),
        UIImage(named: "kite"),
        UIImage(named: "note"),
        UIImage(named: "light"),
        UIImage(named: "swingset"),
        UIImage(named: "family"),
        UIImage(named: "launch"),
        UIImage(named: "mission"),
        UIImage(named: "magazine"),
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        taskCollectionView.register(IconCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        setupViews()
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return taskIcons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! IconCollectionViewCell
        cell.image = taskIcons[indexPath.item]
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 43, height: 43)
    }
    
    

    func setupViews() {
        view.addSubview(taskTitleLabel)
        view.addSubview(textTitleView)
        view.addSubview(chooseIconLabel)
        view.addSubview(taskCollectionView)
        view.addSubview(urgentButton)
        view.addSubview(importantButton)
        view.addSubview(notMuchButton)
        view.addSubview(notificationLabel)
        view.addSubview(dateTextView)
        view.addSubview(detailTaskLabel)
        view.addSubview(detailTextView)
        
        taskCollectionView.delegate = self
        taskCollectionView.dataSource = self
        
        taskTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        taskTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        taskTitleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
//        taskTitle.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50).isActive = true
        taskTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        taskTitleLabel.widthAnchor.constraint(equalToConstant: 90).isActive = true

        textTitleView.topAnchor.constraint(equalTo: view.topAnchor, constant: 125).isActive = true
        textTitleView.leftAnchor.constraint(equalTo: taskTitleLabel.leftAnchor).isActive = true
        textTitleView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        //        textTitleView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50).isActive = true
        textTitleView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        textTitleView.widthAnchor.constraint(equalToConstant: 90).isActive = true

        chooseIconLabel.topAnchor.constraint(equalTo: textTitleView.bottomAnchor, constant: 15).isActive = true
        chooseIconLabel.leftAnchor.constraint(equalTo: textTitleView.leftAnchor).isActive = true
        chooseIconLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        //        chooseIconLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50).isActive = true
        chooseIconLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        chooseIconLabel.widthAnchor.constraint(equalToConstant: 90).isActive = true

       
        
        taskCollectionView.topAnchor.constraint(equalTo: chooseIconLabel.bottomAnchor, constant: 10).isActive = true
        taskCollectionView.leftAnchor.constraint(equalTo: chooseIconLabel.leftAnchor).isActive = true
        taskCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        taskCollectionView.heightAnchor.constraint(equalToConstant: 52).isActive = true
        
        urgentButton.topAnchor.constraint(equalTo: taskCollectionView.bottomAnchor, constant: 20).isActive = true
        urgentButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
//        urgentButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        urgentButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        urgentButton.widthAnchor.constraint(equalToConstant: 56).isActive = true
        
        importantButton.topAnchor.constraint(equalTo: taskCollectionView.bottomAnchor, constant: 20).isActive = true
        importantButton.leftAnchor.constraint(equalTo: urgentButton.rightAnchor, constant: 20).isActive = true
        importantButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        importantButton.widthAnchor.constraint(equalToConstant: 74).isActive = true
        
        notMuchButton.topAnchor.constraint(equalTo: taskCollectionView.bottomAnchor, constant: 20).isActive = true
        notMuchButton.leftAnchor.constraint(equalTo: importantButton.rightAnchor, constant: 20).isActive = true
        notMuchButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        notMuchButton.widthAnchor.constraint(equalToConstant: 71).isActive = true
        
        notificationLabel.topAnchor.constraint(equalTo: urgentButton.bottomAnchor, constant: 26).isActive = true
        notificationLabel.leftAnchor.constraint(equalTo: urgentButton.leftAnchor).isActive = true
        notificationLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        notificationLabel.widthAnchor.constraint(equalToConstant: 93).isActive = true
        
        dateTextView.topAnchor.constraint(equalTo: urgentButton.bottomAnchor, constant: 22).isActive = true
        dateTextView.leftAnchor.constraint(equalTo: notificationLabel.rightAnchor, constant: 30).isActive = true
        dateTextView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        dateTextView.widthAnchor.constraint(equalToConstant: 170).isActive = true
        
        detailTaskLabel.topAnchor.constraint(equalTo: notificationLabel.bottomAnchor, constant: 20).isActive = true
        detailTaskLabel.leftAnchor.constraint(equalTo: notificationLabel.leftAnchor).isActive = true
        detailTaskLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        detailTaskLabel.widthAnchor.constraint(equalToConstant: 99).isActive = true
        
        detailTextView.topAnchor.constraint(equalTo: detailTaskLabel.bottomAnchor, constant: 0).isActive = true
        detailTextView.leftAnchor.constraint(equalTo: detailTaskLabel.leftAnchor).isActive = true
        detailTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        detailTextView.heightAnchor.constraint(equalToConstant: 200).isActive = true

        
    }

    

}
