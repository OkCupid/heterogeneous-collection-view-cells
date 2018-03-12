//
//  CollectionViewCellMacroCommand.swift
//  Heterogenous
//
//  Created by Julian Tejera-Frias on 10/18/17.
//  Copyright © 2017 OkCupid. All rights reserved.
//

import UIKit

struct CollectionViewCellMacroCommand: Command {

    private let commands: [Command]

    init(commands: [Command]) {
        self.commands = commands
    }

    func perform(arguments: [CommandArgumentKey: Any]?) {
        commands.forEach { $0.perform(arguments: arguments) }
    }
}
