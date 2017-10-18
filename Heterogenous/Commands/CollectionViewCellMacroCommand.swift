//
//  CollectionViewCellMacroCommand.swift
//  Heterogenous
//
//  Created by Julian Tejera-Frias on 10/18/17.
//  Copyright © 2017 OkCupid. All rights reserved.
//

import UIKit

struct CollectionViewCellMacroCommand: CollectionViewCellCommand {

    private let commands: [CollectionViewCellCommand]

    init(commands: [CollectionViewCellCommand]) {
        self.commands = commands
    }

    func perform(cell: UICollectionViewCell) {
        commands.forEach { $0.perform(cell: cell) }
    }
}
