//
//  IconCollectionViewCell.swift
//  Taskey
//
//  Created by Ali on 05.11.2019.
//  Copyright © 2019 Ali. All rights reserved.
//

import UIKit

class IconCollectionViewCell: UICollectionViewCell {
    
    var image: UIImage?
    
    
    let iconImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 5
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    func setupView() {
        
        addSubview(iconImageView)
        
        
        iconImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        iconImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        iconImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        iconImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        iconImageView.heightAnchor.constraint(equalToConstant: 34).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 42).isActive = true
        
    }
 
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let image = image {
            iconImageView.image = image
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
