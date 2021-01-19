//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Сони Авдеева on 08/01/2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {
    
    @IBOutlet var profileImage: UIImageView! {
        didSet {
            profileImage.image = UIImage(named: "major.jpg")
        }
    }
    @IBOutlet var profileTitle: UILabel!
    @IBOutlet var profileInfo: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var statusButton: UIButton!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //        profileImage
        profileImage.layer.cornerRadius = 60
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.layer.borderWidth = 3
        profileImage.clipsToBounds = true
        //        profileTitle
        profileTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        profileTitle.textColor = .black
        profileTitle.text = "Major Tom"
        profileInfo.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        //        profileInfo
        profileInfo.textColor = .gray
        profileInfo.text = "Ground Control to Major Tom"
        //        statusButton
        statusButton.setTitle("Show status", for: .normal)
        statusButton.setTitleColor(.white, for: .normal)
        statusButton.backgroundColor = .systemBlue
        statusButton.layer.cornerRadius = 4
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7
        statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        //        textField
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.backgroundColor = .white
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        
        
    }
    
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
}

