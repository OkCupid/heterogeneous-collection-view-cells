//
//  CollectionViewCellViewModelProtocol.swift
//  Heterogenous
//
//  Created by Julian Tejera-Frias on 3/9/18.
//  Copyright © 2018 OkCupid. All rights reserved.
//

import UIKit

protocol CollectionViewCellViewModelProtocol {
    var identifier: String { get }
    var size: CGSize { get }
    var commands: [CommandKey: Command] { get }
}
