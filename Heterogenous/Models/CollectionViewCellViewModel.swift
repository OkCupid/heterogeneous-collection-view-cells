//
//  CollectionViewCellViewModel.swift
//  Heterogenous
//
//  Created by Julian Tejera-Frias on 10/16/17.
//  Copyright © 2017 OkCupid. All rights reserved.
//

import UIKit

struct CollectionViewCellViewModel {
    let identifier: String
    let size: CGSize
    let commands: [CollectionViewCellCommandKey: CollectionViewCellCommand]
}
