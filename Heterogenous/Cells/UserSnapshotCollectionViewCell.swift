//
//  UserSnapshotCollectionViewCell.swift
//  Heterogenous
//
//  Created by Julian Tejera-Frias on 10/16/17.
//  Copyright © 2017 OkCupid. All rights reserved.
//

import UIKit

class UserSnapshotCollectionViewCell: UICollectionViewCell, UserCollectionViewCell {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView! {
        didSet {
            backgroundImageView.contentMode = .scaleAspectFill
        }
    }
    @IBOutlet weak var avatarImageView: UIImageView! {
        didSet {
            avatarImageView.contentMode = .scaleAspectFill
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundImageView.image = nil
        avatarImageView.image = nil 
    }
}
