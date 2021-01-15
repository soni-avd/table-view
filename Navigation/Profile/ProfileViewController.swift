//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Сони Авдеева on 08/01/2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(newButton)
        newButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newButton.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            newButton.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            newButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
        
     var newButton: UIButton = {
        let button = UIButton()
        button.setTitle("Open", for: .normal)
        button.backgroundColor = .purple
        return button
    }()
   
    


}
