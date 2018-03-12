//
//  AnyUserListItemFactory.swift
//  Heterogenous
//
//  Created by Julian Tejera-Frias on 3/12/18.
//  Copyright © 2018 OkCupid. All rights reserved.
//

import UIKit

struct AnyUserListItemFactory: CollectionViewCellViewModelAbstractFactory {

    private let userListItem: AnyUserListItem
    private weak var viewController: UIViewController?

    private var factory: CollectionViewCellViewModelAbstractFactory {
        switch userListItem {
        case .user(let user):
            return UsersCollectionViewCellViewModelFactory(user: user, viewController: viewController)

        case .advertisement(let advertisement):
            return AdvertisementCollectionViewCellViewModelFactory(advertisement: advertisement, viewController: viewController)
        }
    }

    init(userListItem: AnyUserListItem, viewController: UIViewController?) {
        self.userListItem = userListItem
        self.viewController = viewController
    }

    func create() -> CollectionViewCellViewModelProtocol {
        return factory.create()
    }
}
