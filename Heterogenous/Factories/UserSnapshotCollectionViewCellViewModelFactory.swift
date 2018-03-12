//
//  UserSnapshotCollectionViewCellViewModelFactory.swift
//  Heterogenous
//
//  Created by Julian Tejera-Frias on 10/17/17.
//  Copyright © 2017 OkCupid. All rights reserved.
//

import UIKit

struct UserSnapshotCollectionViewCellViewModelFactory: CollectionViewCellViewModelAbstractFactory {

    private let user: User
    private weak var viewController: UIViewController?

    init(user: User, viewController: UIViewController?) {
        self.user = user
        self.viewController = viewController
    }

    func create() -> CollectionViewCellViewModelProtocol {
        let size = CGSize(width: 300, height: 200)
        let configurationCommand = UserSnapshotCollectionViewCellConfigurationCommand(user: user, imageNetworkManager: ImageNetworkManager())
        let selectionCommand = UserCollectionViewCellSelectionCommand(viewController: viewController)
        let commands: [CommandKey: Command] = [
            .configuration: configurationCommand,
            .selection: selectionCommand
        ]
        return CollectionViewCellViewModel(identifier: "UserSnapshotCollectionViewCell", size: size, commands: commands)
    }

}
