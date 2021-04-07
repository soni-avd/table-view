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
       var tv = UIView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .blue
        return tv
    }()
        override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(profileTableView)
        navigationController?.isNavigationBarHidden = true
            let tapAvatar = UITapGestureRecognizer(target: self, action: #selector(tap))
            tapAvatar.delegate = self
//            tapAvatar.numberOfTapsRequired = 1
            ProfileHeaderView().isUserInteractionEnabled = true
            ProfileHeaderView().profileImage.addGestureRecognizer(tapAvatar)
            
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
    }
}
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            return ProfileHeaderView()
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
extension ProfileViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        true
    }
}
