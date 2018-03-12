//
//  Advertisement.swift
//  Heterogenous
//
//  Created by Julian Tejera-Frias on 10/16/17.
//  Copyright © 2017 OkCupid. All rights reserved.
//

import Foundation

struct Advertisement: Codable {
    let id: Int
    let contentUrl: URL
    let clickthroughUrl: URL
    let type: AdvertisementType
}
