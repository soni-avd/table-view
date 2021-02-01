//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Сони Авдеева on 28/01/2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    var photoProfile: PhotoProfile? {
        didSet {
            photoLabel.text = photoProfile?.label
            firstPhoto.image = photoProfile?.photo1
            secondPhoto.image = photoProfile?.photo2
            thirdPhoto.image = photoProfile?.photo3
            forthPhoto.image = photoProfile?.photo4
            
        }
    }

    let photoLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    
    let firstPhoto: UIImageView = {
        let photo = UIImageView()
        photo.clipsToBounds = true
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.layer.cornerRadius = 6
        return photo
    }()
    
    let secondPhoto: UIImageView = {
        let photo = UIImageView()
        photo.clipsToBounds = true
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.layer.cornerRadius = 6
        return photo
    }()
    
    let thirdPhoto: UIImageView = {
        let photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.clipsToBounds = true
        photo.layer.cornerRadius = 6
        return photo
    }()

    let forthPhoto: UIImageView = {
        let photo = UIImageView()
        photo.clipsToBounds = true
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.layer.cornerRadius = 6
        return photo
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpViews() {
        [photoLabel, firstPhoto, secondPhoto, thirdPhoto, forthPhoto].forEach{contentView.addSubview($0)}
        
        let constraints = [
            photoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photoLabel.bottomAnchor.constraint(equalTo: firstPhoto.topAnchor, constant: -12),
            
            firstPhoto.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            firstPhoto.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            firstPhoto.trailingAnchor.constraint(equalTo: secondPhoto.leadingAnchor, constant: -8),
            firstPhoto.widthAnchor.constraint(lessThanOrEqualTo: contentView.widthAnchor, multiplier: 0.25),
            firstPhoto.heightAnchor.constraint(equalTo: firstPhoto.widthAnchor),
            
            secondPhoto.leadingAnchor.constraint(equalTo: firstPhoto.trailingAnchor, constant: 8),
            secondPhoto.trailingAnchor.constraint(equalTo: thirdPhoto.leadingAnchor, constant: -8),
            secondPhoto.bottomAnchor.constraint(equalTo: firstPhoto.bottomAnchor),
            secondPhoto.widthAnchor.constraint(equalTo: firstPhoto.widthAnchor),
            secondPhoto.heightAnchor.constraint(equalTo: firstPhoto.widthAnchor),

            
            thirdPhoto.leadingAnchor.constraint(equalTo: secondPhoto.trailingAnchor, constant: 8),
            thirdPhoto.trailingAnchor.constraint(equalTo: forthPhoto.leadingAnchor, constant: -8),
            thirdPhoto.bottomAnchor.constraint(equalTo: firstPhoto.bottomAnchor),
            thirdPhoto.widthAnchor.constraint(equalTo: firstPhoto.widthAnchor),
            thirdPhoto.heightAnchor.constraint(equalTo: firstPhoto.widthAnchor),

            forthPhoto.leadingAnchor.constraint(equalTo: thirdPhoto.trailingAnchor, constant: 8),
            forthPhoto.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            forthPhoto.bottomAnchor.constraint(equalTo: firstPhoto.bottomAnchor),
            forthPhoto.widthAnchor.constraint(equalTo: firstPhoto.widthAnchor),
            forthPhoto.heightAnchor.constraint(equalTo: firstPhoto.widthAnchor),
            

        ]
        NSLayoutConstraint.activate(constraints)


    }
}
