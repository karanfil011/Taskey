//
//  MainCollectionViewCell.swift
//  Taskey
//
//  Created by Ali on 06.11.2019.
//  Copyright © 2019 Ali. All rights reserved.
//

import UIKit

protocol ChangeTask {
    func deleteTask(indx: Int)
}

class MainCollectionViewCell: UICollectionViewCell {
    
    let mainImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let mainTitleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Title"
        title.font = UIFont.systemFont(ofSize: 17)
        return title
    }()
    
    let checkBoxImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let deleteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "deleteButton"), for: .normal)
        return button
    }()
    
    var iconImage: UIImage?
    var checkBoxImage: UIImage?
    var taskTitle: String?
    
    var delegate: ChangeTask?
    var index: IndexPath?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        deleteButton.addTarget(self, action: #selector(deleteTask), for: .touchUpInside)
        
        
        setupView()
    }
    
    @objc func deleteTask(sender: Any) {
        
        delegate?.deleteTask(indx: index!.row)
        
    }
    
    func setupView() {
        addSubview(mainImageView)
        addSubview(checkBoxImageView)
        addSubview(mainTitleLabel)
        addSubview(deleteButton)
        
        self.backgroundColor = .green
        self.layer.cornerRadius = 5
        
        deleteButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        deleteButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        deleteButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        deleteButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        mainImageView.topAnchor.constraint(equalTo: topAnchor, constant: 17).isActive = true
        mainImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -17).isActive = true
        mainImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        checkBoxImageView.topAnchor.constraint(equalTo: topAnchor, constant: 17).isActive = true
        checkBoxImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 17).isActive = true
        checkBoxImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        checkBoxImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        mainTitleLabel.topAnchor.constraint(equalTo: checkBoxImageView.bottomAnchor, constant: 14).isActive = true
        mainTitleLabel.leftAnchor.constraint(equalTo: checkBoxImageView.leftAnchor).isActive = true
        mainTitleLabel.rightAnchor.constraint(equalTo: mainImageView.rightAnchor).isActive = true
        mainTitleLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let image = iconImage {
            mainImageView.image = image
        }
        
        if let image = checkBoxImage {
            checkBoxImageView.image = image
        }
        
        if let title = taskTitle {
            mainTitleLabel.text = title
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
