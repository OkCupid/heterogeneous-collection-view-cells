//
//  AdvertisementCollectionViewCell.swift
//  Heterogenous
//
//  Created by Julian Tejera-Frias on 10/16/17.
//  Copyright © 2017 OkCupid. All rights reserved.
//

import UIKit

class AdvertisementCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var adImageView: UIImageView! {
        didSet {
            adImageView.contentMode = .scaleAspectFit
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        adImageView.image = nil 
    }

}
