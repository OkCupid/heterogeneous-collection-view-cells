//
//  UsersCollectionViewCellViewModelFactory.swift
//  Heterogenous
//
//  Created by Julian Tejera-Frias on 10/16/17.
//  Copyright © 2017 OkCupid. All rights reserved.
//

import UIKit

struct UsersCollectionViewCellViewModelFactory {

    private let snapshotFactory = UserSnapshotCollectionViewCellViewModelFactory()
    private let circularFactory = CircularUserCollectionViewCellViewModelFactory()

    func create(user: User, viewController: UIViewController) -> CollectionViewCellViewModel {
        switch user.type {
        case .regular:
            return circularFactory.create(user: user, viewController: viewController)
        case .featured:
            return snapshotFactory.create(user: user, viewController: viewController)
        }
    }

}
