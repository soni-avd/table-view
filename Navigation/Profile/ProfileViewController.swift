//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Сони Авдеева on 08/01/2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
     var profileHeaderView: ProfileHeaderView! = {
       let hv = ProfileHeaderView()
        hv.translatesAutoresizingMaskIntoConstraints = false
        return hv
    }()


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
        profileHeaderView.addSubview(profileHeaderView.profileImage)
        profileHeaderView.addSubview(profileHeaderView.profileTitle)
        profileHeaderView.addSubview(profileHeaderView.profileInfo)
        profileHeaderView.addSubview(profileHeaderView.textField)
        profileHeaderView.addSubview(profileHeaderView.statusButton)
        profileHeaderView.backgroundColor = .yellow
        view.addSubview(newButton)
        newButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newButton.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            newButton.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            newButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),

            profileHeaderView.profileImage.topAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: 16),
            profileHeaderView.profileImage.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 16),
            profileHeaderView.profileImage.heightAnchor.constraint(equalToConstant: 120),
            profileHeaderView.profileImage.widthAnchor.constraint(equalToConstant: 120),
            
            
            profileHeaderView.profileTitle.topAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: 27),
            profileHeaderView.profileTitle.heightAnchor.constraint(equalToConstant: 30),
            profileHeaderView.profileTitle.leadingAnchor.constraint(equalTo: profileHeaderView.profileImage.trailingAnchor, constant: 16),
            profileHeaderView.profileTitle.widthAnchor.constraint(equalToConstant: 180),

            profileHeaderView.statusButton.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 16),
            profileHeaderView.statusButton.trailingAnchor.constraint(equalTo: profileHeaderView.trailingAnchor, constant: -16),
            profileHeaderView.statusButton.heightAnchor.constraint(equalToConstant: 50),
            profileHeaderView.statusButton.topAnchor.constraint(equalTo: profileHeaderView.profileImage.bottomAnchor, constant: 16),

            profileHeaderView.profileInfo.leadingAnchor.constraint(equalTo: profileHeaderView.profileImage.trailingAnchor, constant: 16),
            profileHeaderView.profileInfo.topAnchor.constraint(equalTo: profileHeaderView.profileTitle.bottomAnchor, constant: 16),
            profileHeaderView.profileInfo.heightAnchor.constraint(equalToConstant: 20),
            profileHeaderView.profileInfo.widthAnchor.constraint(equalToConstant: 200),
            
            profileHeaderView.textField.bottomAnchor.constraint(equalTo: profileHeaderView.statusButton.topAnchor, constant: -15),
            profileHeaderView.textField.leadingAnchor.constraint(equalTo: profileHeaderView.profileTitle.leadingAnchor),
            profileHeaderView.textField.heightAnchor.constraint(equalToConstant: 40),
            profileHeaderView.textField.widthAnchor.constraint(equalToConstant: 200)
            
           
        ])
        
    }
        
     var newButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Open", for: .normal)
        button.backgroundColor = .purple
        return button
    }()
}
