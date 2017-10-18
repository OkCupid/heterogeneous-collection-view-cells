//
//  AdvertisementCollectionViewCellViewModelFactory.swift
//  Heterogenous
//
//  Created by Julian Tejera-Frias on 10/17/17.
//  Copyright © 2017 OkCupid. All rights reserved.
//

import UIKit

struct AdvertisementCollectionViewCellViewModelFactory {

    func create(advertisement: Advertisement, application: UIApplication) -> CollectionViewCellViewModel {
        let size = CGSize(width: 220, height: 220)
        let configurationCommand = AdvertisementCollectionViewCellConfigurationCommand(advertisement: advertisement, imageNetworkManager: ImageNetworkManager())
        let selectionCommand = AdvertisementCollectionViewCellSelectionCommand(advertisement: advertisement, application: application)
        let commands: [CollectionViewCellCommandKey: CollectionViewCellCommand] = [
            .configuration: configurationCommand,
            .selection: selectionCommand
        ]

        return CollectionViewCellViewModel(identifier: "AdvertisementCollectionViewCell", size: size, commands: commands)
    }

}
