//
//  AnyUserListItem.swift
//  Heterogenous
//
//  Created by Julian Tejera-Frias on 3/9/18.
//  Copyright © 2018 OkCupid. All rights reserved.
//

import Foundation

enum AnyUserListItem: Decodable {

    enum CodingKeys: String, CodingKey {
        case klass
    }

    case user(User)
    case advertisement(Advertisement)

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let klass = try container.decode(UserListItemType.self, forKey: .klass)

        switch klass {
        case .advertisement:
            self = .advertisement(try Advertisement(from: decoder))
        case .user:
            self = .user(try User(from: decoder))
        }
    }

}
