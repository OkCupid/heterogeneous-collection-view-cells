//
//  CollectionViewCellCommand.swift
//  Heterogenous
//
//  Created by Julian Tejera-Frias on 10/17/17.
//  Copyright © 2017 OkCupid. All rights reserved.
//

import UIKit

protocol Command {
    func perform(arguments: [CommandArgumentKey: Any]?)
}
