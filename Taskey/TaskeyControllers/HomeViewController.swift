//
//  HomeViewController.swift
//  Taskey
//
//  Created by Ali on 05.11.2019.
//  Copyright © 2019 Ali. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        let mainCV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        mainCV.allowsSelection = true
        mainCV.showsVerticalScrollIndicator = false
        mainCV.backgroundColor = .white
        mainCV.translatesAutoresizingMaskIntoConstraints = false
        return mainCV
    }()
    
    let completedLabel: UILabel = {
        let label = UILabel()
        label.text = "Completed:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    

    let mainCvCellId = "mainCvCellId"
    
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
    
    let checkBoxImage = [
        UIImage(named: "uncheckedBox"),
        UIImage(named: "checkedBox")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainCollectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: mainCvCellId)
        
        setupView()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mainCvCellId, for: indexPath) as! MainCollectionViewCell
        cell.iconImage = taskIcons[indexPath.item]
        cell.checkBoxImage = checkBoxImage[0]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 164, height: 157)
    }
    
    func setupView() {
        view.addSubview(mainCollectionView)
        view.addSubview(completedLabel)
        
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        
        mainCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        mainCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mainCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -130).isActive = true
        
        completedLabel.topAnchor.constraint(equalTo: mainCollectionView.bottomAnchor, constant: 20).isActive = true
        completedLabel.leftAnchor.constraint(equalTo: mainCollectionView.leftAnchor, constant: 20).isActive = true
        completedLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }


}
