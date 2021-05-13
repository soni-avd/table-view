//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Сони Авдеева on 08/01/2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    var profileHeaderView: UIView! = {
        let hv = UIView()
        hv.backgroundColor = .lightGray
        hv.translatesAutoresizingMaskIntoConstraints = false
        return hv
    }()
    
    lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "major.jpg")
        image.layer.cornerRadius = 60
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 3
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var profileTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.textColor = .black
        title.text = "Major Tom"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
        
    }()
    var profileInfo: UILabel = {
        let info = UILabel()
        info.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        info.textColor = .gray
        info.translatesAutoresizingMaskIntoConstraints = false
        info.text = "Ground Control to Major Tom"
        return info
    }()
    var textField: UITextField = {
        let text = UITextField()
        text.layer.cornerRadius = 12
        text.layer.borderColor = UIColor.black.cgColor
        text.layer.borderWidth = 1
        text.backgroundColor = .white
        text.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        text.textColor = .black
        text.translatesAutoresizingMaskIntoConstraints = false
        text.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        return text
    }()
    var statusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
       private var statusText: String?

    @objc func buttonPressed() {
        print("\(profileInfo.text!)")
        if let statusText = statusText {
            profileInfo.text = statusText
        }
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(profileHeaderView)
        profileHeaderView.addSubview(profileImage)
        profileHeaderView.addSubview(profileTitle)
        profileHeaderView.addSubview(profileInfo)
        profileHeaderView.addSubview(textField)
        profileHeaderView.addSubview(statusButton)
        
        
        NSLayoutConstraint.activate([
            
            profileHeaderView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            profileImage.topAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: 16),
            profileImage.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 16),
            profileImage.heightAnchor.constraint(equalToConstant: 120),
            profileImage.widthAnchor.constraint(equalToConstant: 120),
            
            profileTitle.topAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: 27),
            profileTitle.heightAnchor.constraint(equalToConstant: 30),
            profileTitle.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 152),
            profileTitle.widthAnchor.constraint(equalToConstant: 180),
            
            statusButton.widthAnchor.constraint(equalTo: profileHeaderView.widthAnchor, multiplier: 0.9),
            statusButton.centerXAnchor.constraint(equalTo: profileHeaderView.centerXAnchor),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            statusButton.bottomAnchor.constraint(equalTo: profileHeaderView.bottomAnchor, constant: -16),
            
            profileInfo.leadingAnchor.constraint(equalTo: profileTitle.leadingAnchor),
            profileInfo.topAnchor.constraint(equalTo: profileTitle.bottomAnchor, constant: 16),
            profileInfo.heightAnchor.constraint(equalToConstant: 20),
            profileInfo.widthAnchor.constraint(equalTo:statusButton.widthAnchor, multiplier: 0.5),
            
            textField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -15),
            textField.leadingAnchor.constraint(equalTo: profileTitle.leadingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 40),
            textField.widthAnchor.constraint(equalTo: statusButton.widthAnchor, multiplier: 0.5)
        ])
    }
}

