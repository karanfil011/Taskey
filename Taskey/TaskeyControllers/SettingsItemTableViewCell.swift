//
//  SettingsItemTableViewCell.swift
//  Taskey
//
//  Created by Ali on 06.11.2019.
//  Copyright © 2019 Ali. All rights reserved.
//

import UIKit

class SettingsItemTableViewCell: UITableViewCell {

    let settingsName: UILabel = {
        let name = UILabel()
        name.text = "Name"
        name.font = UIFont.systemFont(ofSize: 15)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
  
    let facebookIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
        
    }()
    
    let twitterIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let telegramIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    var name: String?
    var facebookImage: UIImage?
    var twitterImage: UIImage?
    var telegramImage: UIImage?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    func setupView() {
        addSubview(settingsName)
        addSubview(facebookIcon)
        addSubview(twitterIcon)
        addSubview(telegramIcon)
        
        settingsName.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        settingsName.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        
        facebookIcon.heightAnchor.constraint(equalToConstant: 40).isActive = true
        facebookIcon.widthAnchor.constraint(equalToConstant: 40).isActive = true
        facebookIcon.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        facebookIcon.centerYAnchor.constraint(equalTo: settingsName.centerYAnchor).isActive = true
        
        
        twitterIcon.heightAnchor.constraint(equalToConstant: 40).isActive = true
        twitterIcon.widthAnchor.constraint(equalToConstant: 40).isActive = true
        twitterIcon.rightAnchor.constraint(equalTo: facebookIcon.leftAnchor, constant: -10).isActive = true
        twitterIcon.centerYAnchor.constraint(equalTo: settingsName.centerYAnchor).isActive = true
        
        telegramIcon.heightAnchor.constraint(equalToConstant: 40).isActive = true
        telegramIcon.widthAnchor.constraint(equalToConstant: 40).isActive = true
        telegramIcon.rightAnchor.constraint(equalTo: twitterIcon.leftAnchor, constant: -10).isActive = true
        telegramIcon.centerYAnchor.constraint(equalTo: settingsName.centerYAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let name = name {
            settingsName.text = name
        }
        
        if let facebookImage = facebookImage {
            facebookIcon.image = facebookImage
        }
        
        if let twitterImage = twitterImage {
            twitterIcon.image = twitterImage
        }
        
        if let telegramImage = telegramImage {
            telegramIcon.image = telegramImage
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
