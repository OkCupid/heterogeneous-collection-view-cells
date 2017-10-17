//
//  CircularUserCollectionViewCell.swift
//  Heterogenous
//
//  Created by Julian Tejera-Frias on 10/16/17.
//  Copyright © 2017 OkCupid. All rights reserved.
//

import UIKit

class CircularUserCollectionViewCell: UICollectionViewCell, UserCollectionViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView! {
        didSet {
            avatarImageView.contentMode = .scaleAspectFit
        }
    }
    @IBOutlet weak var usernameLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImageView.image = nil 
    }
}
