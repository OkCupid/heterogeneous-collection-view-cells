//
//  UserSnapshotCollectionViewCellViewModelFactory.swift
//  Heterogenous
//
//  Created by Julian Tejera-Frias on 10/17/17.
//  Copyright © 2017 OkCupid. All rights reserved.
//

import UIKit

struct UserSnapshotCollectionViewCellViewModelFactory {

    func create(user: User, viewController: UIViewController) -> CollectionViewCellViewModel {
        let size = CGSize(width: 300, height: 200)
        let configurationCommand = UserSnapshotCollectionViewCellConfigurationCommand(user: user, imageNetworkManager: ImageNetworkManager())
        let selectionCommand = UserCollectionViewCellSelectionCommand(viewController: viewController)
        let commands: [CollectionViewCellCommandKey: CollectionViewCellCommand] = [
            .configuration: configurationCommand,
            .selection: selectionCommand
        ]
        return CollectionViewCellViewModel(identifier: "UserSnapshotCollectionViewCell", size: size, commands: commands)
    }

}
