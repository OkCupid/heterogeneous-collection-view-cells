//
//  Advertisement.swift
//  Heterogenous
//
//  Created by Julian Tejera-Frias on 10/16/17.
//  Copyright © 2017 OkCupid. All rights reserved.
//

import Foundation

struct Advertisement {
    let id: Int
    let contentUrl: URL
    let clickthroughUrl: URL
    let type: AdvertisementType

    // Test data
    static var all: [Advertisement] {
        return [
            Advertisement(id: 1, contentUrl: URL(string: "https://cdn.okccdn.com/media/img/hub/mediakit/okcupid_darkbg.png")!, clickthroughUrl: URL(string: "https://okcupid.com/home")!, type: .image)
        ]
    }
}
