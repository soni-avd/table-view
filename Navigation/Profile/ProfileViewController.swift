//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Сони Авдеева on 08/01/2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    lazy var profileTableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.delegate = self
        tv.dataSource = self
        tv.register(ProfileTableViewCell.self, forCellReuseIdentifier: String(describing: ProfileTableViewCell.self))
        tv.register(PhotosTableViewCell.self, forCellReuseIdentifier: String(describing: PhotosTableViewCell.self))
        tv.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: String(describing: ProfileHeaderView.self))
        tv.isUserInteractionEnabled = true
        return tv
    }()
    var transparentView: UIView = {
        let tv = UIView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.5)
        return tv
    }()
   
    let hv = ProfileHeaderView()

    let buttonX: UIButton = {
        let x = UIButton(type: .close)
        x.translatesAutoresizingMaskIntoConstraints = false
        return x
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(profileTableView)
        navigationController?.isNavigationBarHidden = true
        
        let constraints = [
            profileTableView.topAnchor.constraint(equalTo: view.topAnchor),
            profileTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    @objc func tap() {
        print(#function)
        self.hv.addSubview(self.transparentView)
    self.transparentView.frame = .init(x: self.view.bounds.minX,
                                       y: self.view.bounds.minY,
                                        width: self.view.bounds.width,
                                        height: self.view.bounds.height)
    self.transparentView.transform = self.transparentView.transform.scaledBy(x: 2, y: 2)
        let startAnimator = UIViewPropertyAnimator(duration: 1, curve: .easeInOut) {
           
            self.transparentView.addSubview(self.hv.profileImage)
            self.hv.addSubview(self.buttonX)
            self.hv.profileImage.alpha = 1
        self.hv.profileImage.frame = .init(x: 100,
                                         y: self.view.bounds.height / 2 - 60,
                                         width: 120,
                                         height: 120)
            self.hv.profileImage.layer.cornerRadius = 0
        self.hv.profileImage.transform = self.hv.profileImage.transform.scaledBy(x: 1.3, y: 1.3)
        
        self.buttonX.frame = .init(x: self.view.bounds.maxX - 15,
                                   y: self.view.bounds.minY,
                                   width: 15,
                                   height: 15)
 
    }
        startAnimator.startAnimation()
        let finishAnimator = UIViewPropertyAnimator(duration: 1, curve: .easeInOut) { [self] in
            buttonX.addTarget(self, action: #selector(closeAnimation), for: .touchUpInside)
        }
        finishAnimator.startAnimation()
    }
    @objc func closeAnimation() {
        print(#function)
        transparentView.frame = .init(x: 0,
                                      y: 0,
                                      width: 0,
                                      height: 0)
        hv.addSubview(hv.profileImage)
        NSLayoutConstraint.activate([
            hv.profileImage.topAnchor.constraint(equalTo: hv.topAnchor, constant: 16),
            hv.profileImage.leadingAnchor.constraint(equalTo: hv.leadingAnchor, constant: 16),
            hv.profileImage.heightAnchor.constraint(equalToConstant: 120),
            hv.profileImage.widthAnchor.constraint(equalToConstant: 120),
                    ])
        hv.profileImage.transform = hv.profileImage.transform.scaledBy(x: 0.7, y: 0.7)
        hv.profileImage.layer.cornerRadius = 60
        buttonX.alpha = 0
    }
    
}
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            hv.isUserInteractionEnabled = true
            let tapAvatar = UITapGestureRecognizer(target: self, action: #selector(tap))
            hv.profileImage.addGestureRecognizer(tapAvatar)
            return hv
        default:
            return nil
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 220
        default:
            return .zero
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photosViewController = PhotosViewController()
        navigationController?.pushViewController(photosViewController, animated: true)
    }
}
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return Storage.tableModel.count
        default:
            break
        }
        return section
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell: PhotosTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: PhotosTableViewCell.self)) as! PhotosTableViewCell
            cell.photoProfile = StoragePhotoProfile.tableModel
            return cell
        } else {
            
            let cell: ProfileTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProfileTableViewCell.self), for: indexPath) as! ProfileTableViewCell
            cell.post = Storage.tableModel[indexPath.row]
            return cell
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}
