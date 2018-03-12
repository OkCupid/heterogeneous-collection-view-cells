//
//  UserSnapshotCollectionViewCellConfigurationCommand.swift
//  Heterogenous
//
//  Created by Julian Tejera-Frias on 10/16/17.
//  Copyright © 2017 OkCupid. All rights reserved.
//

import UIKit

struct UserSnapshotCollectionViewCellConfigurationCommand: Command {

    private let user: User
    private let imageNetworkManager: ImageNetworkManagerProtocol

    init(user: User, imageNetworkManager: ImageNetworkManagerProtocol = ImageNetworkManager()) {
        self.user = user
        self.imageNetworkManager = imageNetworkManager
    }

    func perform(arguments: [CommandArgumentKey: Any]?) {
        guard let cell = arguments?[.cell] as? UserSnapshotCollectionViewCell else {
            return
        }

        let command = UserCollectionViewCellConfigurationCommand(user: user, imageNetworkManager: imageNetworkManager)
        command.perform(arguments: [.cell: cell])

        if let backgroundUrl = user.backgroundUrl {
            _ = imageNetworkManager.request(url: backgroundUrl) { (image) in
                cell.backgroundImageView.image = image
            }
        }

    }

}
