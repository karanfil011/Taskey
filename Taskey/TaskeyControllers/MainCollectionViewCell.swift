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
    func checkTask(indChk: Int)
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
//        title.text = "Title"
        title.font = UIFont.systemFont(ofSize: 17)
        return title
    }()
    
    let checkBoxImageButton: UIButton = {
        let image = UIButton()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isUserInteractionEnabled = true
        image.isEnabled = true
        image.isMultipleTouchEnabled = true
        return image
    }()
    
    let deleteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "deleteButton"), for: .normal)
        return button
    }()
    
    
    var delegate: ChangeTask?
    var checkDelegate: ChangeTask?
    var index: IndexPath?
    
    var indChk: IndexPath?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        deleteButton.addTarget(self, action: #selector(deleteTask), for: .touchUpInside)
        checkBoxImageButton.addTarget(self, action: #selector(checkTask), for: .touchUpInside)
        
        setupView()
    }
    
    @objc func deleteTask(sender: Any) {
        
        delegate?.deleteTask(indx: index!.row)
        
    }
    
    @objc func checkTask(sender: Any) {
        checkDelegate?.checkTask(indChk: index!.row)
    }
    
    func setupView() {
        addSubview(mainImageView)
        addSubview(checkBoxImageButton)
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
        
        checkBoxImageButton.topAnchor.constraint(equalTo: topAnchor, constant: 17).isActive = true
        checkBoxImageButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 17).isActive = true
        checkBoxImageButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        checkBoxImageButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        mainTitleLabel.topAnchor.constraint(equalTo: checkBoxImageButton.bottomAnchor, constant: 14).isActive = true
        mainTitleLabel.leftAnchor.constraint(equalTo: checkBoxImageButton.leftAnchor).isActive = true
        mainTitleLabel.rightAnchor.constraint(equalTo: mainImageView.rightAnchor).isActive = true
        mainTitleLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
