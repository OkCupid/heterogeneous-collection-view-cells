//
//  AdvertisementCollectionViewCellViewModelFactory.swift
//  Heterogenous
//
//  Created by Julian Tejera-Frias on 10/17/17.
//  Copyright © 2017 OkCupid. All rights reserved.
//

import UIKit

struct AdvertisementCollectionViewCellViewModelFactory: CollectionViewCellViewModelAbstractFactory {

    private let advertisement: Advertisement
    private weak var viewController: UIViewController?

    init(advertisement: Advertisement, viewController: UIViewController?) {
        self.advertisement = advertisement
        self.viewController = viewController
    }

    func create() -> CollectionViewCellViewModelProtocol {
        let size = CGSize(width: 220, height: 220)
        let configurationCommand = AdvertisementCollectionViewCellConfigurationCommand(advertisement: advertisement, imageNetworkManager: ImageNetworkManager())
        let selectionCommand = AdvertisementCollectionViewCellSelectionCommand(advertisement: advertisement, viewController: viewController)
        let commands: [CommandKey: Command] = [
            .configuration: configurationCommand,
            .selection: selectionCommand
        ]

        return CollectionViewCellViewModel(identifier: "AdvertisementCollectionViewCell", size: size, commands: commands)
    }

}
