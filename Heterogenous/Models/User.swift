//
//  User.swift
//  Heterogenous
//
//  Created by Julian Tejera-Frias on 10/16/17.
//  Copyright © 2017 OkCupid. All rights reserved.
//

import Foundation

struct User: Codable {
    let username: String
    let avatarUrl: URL
    let backgroundUrl: URL?
    let type: UserType
}


