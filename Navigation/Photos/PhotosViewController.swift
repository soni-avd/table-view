//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Сони Авдеева on 29/01/2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

final class PhotosViewController: UIViewController {
    
    private let layout = UICollectionViewFlowLayout()
    private lazy var photosCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(photosCollectionView)
        view.backgroundColor = .blue
        photosCollectionView.translatesAutoresizingMaskIntoConstraints = false
        title = "Photo Gallery"
        
    }
    
    
    
}
