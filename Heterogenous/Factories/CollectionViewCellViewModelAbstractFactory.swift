//
//  CollectionViewCellViewModelAbstractFactory.swift
//  Heterogenous
//
//  Created by Julian Tejera-Frias on 3/9/18.
//  Copyright © 2018 OkCupid. All rights reserved.
//

import Foundation

protocol CollectionViewCellViewModelAbstractFactory {
    func create() -> CollectionViewCellViewModelProtocol
}
