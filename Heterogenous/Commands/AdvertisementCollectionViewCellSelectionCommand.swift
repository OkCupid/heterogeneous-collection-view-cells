//
//  AdvertisementCollectionViewCellSelectionCommand.swift
//  Heterogenous
//
//  Created by Julian Tejera-Frias on 10/17/17.
//  Copyright © 2017 OkCupid. All rights reserved.
//

import UIKit

struct AdvertisementCollectionViewCellSelectionCommand: CollectionViewCellCommand {

    private let application: UIApplication
    private let advertisement: Advertisement

    init(advertisement: Advertisement, application: UIApplication) {
        self.application = application
        self.advertisement = advertisement
    }

    func perform(cell: UICollectionViewCell) {

        if application.canOpenURL(advertisement.clickthroughUrl) {
            application.open(advertisement.clickthroughUrl, options: [:], completionHandler: nil)
        }

    }
}
