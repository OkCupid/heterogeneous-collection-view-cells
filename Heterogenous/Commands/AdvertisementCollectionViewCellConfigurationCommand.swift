//
//  AdvertisementCollectionViewCellConfigurationCommand.swift
//  Heterogenous
//
//  Created by Julian Tejera-Frias on 10/16/17.
//  Copyright © 2017 OkCupid. All rights reserved.
//

import UIKit

class AdvertisementCollectionViewCellConfigurationCommand: CollectionViewCellCommand {

    private let advertisement: Advertisement
    private let imageNetworkManager: ImageNetworkManagerProtocol

    init(advertisement: Advertisement, imageNetworkManager: ImageNetworkManagerProtocol = ImageNetworkManager()) {
        self.advertisement = advertisement
        self.imageNetworkManager = imageNetworkManager
    }

    func perform(cell: UICollectionViewCell) {
        guard let cell = cell as? AdvertisementCollectionViewCell else {
            return
        }

        _ = imageNetworkManager.request(url: advertisement.contentUrl) { (image) in
            cell.adImageView.image = image
        }
    }


}
