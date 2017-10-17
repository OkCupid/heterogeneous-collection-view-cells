//
//  UserCollectionViewCellSelectionCommand.swift
//  Heterogenous
//
//  Created by Julian Tejera-Frias on 10/17/17.
//  Copyright © 2017 OkCupid. All rights reserved.
//

import UIKit

struct UserCollectionViewCellSelectionCommand: CollectionViewCellCommand {

    private weak var viewController: UIViewController?

    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    func perform(cell: UICollectionViewCell) {
        guard let cell = cell as? (UserCollectionViewCell & UICollectionViewCell) else {
            return
        }

        let storyboard = UIStoryboard(name: "Zoom", bundle: nil)
        let imageZoomViewController = storyboard.instantiateViewController(withIdentifier: "ImageZoomViewController") as! ImageZoomViewController
        imageZoomViewController.image = cell.avatarImageView.image
        imageZoomViewController.username = cell.usernameLabel.text
        viewController?.navigationController?.pushViewController(imageZoomViewController, animated: true)
    }
}
