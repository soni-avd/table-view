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
        tv.isUserInteractionEnabled = true
        tv.alpha = 0
        return tv
    }()
    
    let hv = ProfileHeaderView()
    
    let buttonX: UIButton = {
        let x = UIButton(type: .close)
        x.isUserInteractionEnabled = true
        x.translatesAutoresizingMaskIntoConstraints = false
        x.addTarget(self, action: #selector(closeAnimation), for: .touchUpInside)
        x.alpha = 0
        return x
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(profileTableView)
        view.addSubview(transparentView)
        view.addSubview(buttonX)
        view.addSubview(hv)
        view.addSubview(hv.profileImage)
        navigationController?.isNavigationBarHidden = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        hv.profileImage.addGestureRecognizer(tapGesture)
        
        let constraints = [
            profileTableView.topAnchor.constraint(equalTo: view.topAnchor),
            profileTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            transparentView.topAnchor.constraint(equalTo: profileTableView.topAnchor),
            transparentView.leadingAnchor.constraint(equalTo: profileTableView.leadingAnchor),
            transparentView.trailingAnchor.constraint(equalTo: profileTableView.trailingAnchor),
            transparentView.bottomAnchor.constraint(equalTo: profileTableView.bottomAnchor),
            
            buttonX.topAnchor.constraint(equalTo: hv.safeAreaLayoutGuide.topAnchor, constant: 15),
            buttonX.trailingAnchor.constraint(equalTo: hv.trailingAnchor, constant: -15),
            buttonX.widthAnchor.constraint(equalToConstant: 15),
            buttonX.heightAnchor.constraint(equalToConstant: 15),
            
            hv.profileImage.topAnchor.constraint(equalTo: profileTableView.topAnchor, constant: 16),
            hv.profileImage.leadingAnchor.constraint(equalTo: profileTableView.leadingAnchor, constant: 16),
            hv.profileImage.heightAnchor.constraint(equalToConstant: 120),
            hv.profileImage.widthAnchor.constraint(equalToConstant: 120),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    @objc func closeAnimation() {
        print(#function)
        transparentView.alpha = 0
        buttonX.alpha = 0
        
        
    }
    @objc func tap() {
        print(#function)
        UIView.animateKeyframes(withDuration: 2, delay: 0, options: .beginFromCurrentState, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                self.transparentView.backgroundColor = .white
                self.transparentView.alpha = 0.5
                self.hv.profileImage.translatesAutoresizingMaskIntoConstraints = true
//
                self.hv.profileImage.frame = .init(x: self.view.bounds.minX + 100,
                                                   y: self.view.bounds.height / 2 - 60,
                                                   width: self.view.bounds.width - 200,
                                                   height: 180)
                self.hv.profileImage.transform = self.hv.profileImage.transform.scaledBy(x: 2, y: 2)
            }
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 2) {
                self.view.addSubview(self.buttonX)
                self.buttonX.alpha = 1
            }
           
        }, completion: { finished in
            print(finished)
        })
    }
}
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        return hv
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

