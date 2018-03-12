//
//  UsersCollectionViewCellViewModelFactory.swift
//  Heterogenous
//
//  Created by Julian Tejera-Frias on 10/16/17.
//  Copyright © 2017 OkCupid. All rights reserved.
//

import UIKit

struct UsersCollectionViewCellViewModelFactory: CollectionViewCellViewModelAbstractFactory {

    private let user: User
    private weak var viewController: UIViewController?

    private var factory: CollectionViewCellViewModelAbstractFactory {
        switch user.type {
        case .regular:
            return CircularUserCollectionViewCellViewModelFactory(user: user, viewController: viewController)
        case .featured:
            return UserSnapshotCollectionViewCellViewModelFactory(user: user, viewController: viewController)
        }
    }

    init(user: User, viewController: UIViewController?) {
        self.user = user
        self.viewController = viewController
    }

    func create() -> CollectionViewCellViewModelProtocol {
        return factory.create()
    }

}
