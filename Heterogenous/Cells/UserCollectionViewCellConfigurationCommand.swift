//
//  UserCollectionViewCellConfigurationCommand.swift
//  Heterogenous
//
//  Created by Julian Tejera-Frias on 10/16/17.
//  Copyright © 2017 OkCupid. All rights reserved.
//

import UIKit

struct UserCollectionViewCellConfigurationCommand: CollectionViewCellCommand {

    private let user: User
    private let imageNetworkManager: ImageNetworkManagerProtocol

    init(user: User, imageNetworkManager: ImageNetworkManagerProtocol = ImageNetworkManager()) {
        self.user = user
        self.imageNetworkManager = imageNetworkManager
    }

    func perform(cell: UICollectionViewCell) {
        guard let cell = cell as? (UICollectionViewCell & UserCollectionViewCell) else {
            return
        }

        cell.usernameLabel.text = user.username
        _ = imageNetworkManager.request(url: user.avatarUrl) { (image) in
            cell.avatarImageView.image = image
        }

        roundCorners(view: cell.avatarImageView, cornerRadius: cell.avatarImageView.bounds.width / 2.0)
        addShadow(view: cell)
        roundCorners(view: cell.contentView, cornerRadius: 4.0)
    }

    // MARK: - Private

    private func roundCorners(view: UIView, cornerRadius: CGFloat) {
        view.layer.masksToBounds = true
        view.layer.cornerRadius = cornerRadius
    }

    private func addShadow(view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.layer.shadowRadius = 1
        view.layer.shadowOpacity = 0.1
        view.layer.masksToBounds = false
    }
}
