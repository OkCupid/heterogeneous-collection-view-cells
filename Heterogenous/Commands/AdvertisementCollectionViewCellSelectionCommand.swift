//
//  AdvertisementCollectionViewCellSelectionCommand.swift
//  Heterogenous
//
//  Created by Julian Tejera-Frias on 10/17/17.
//  Copyright © 2017 OkCupid. All rights reserved.
//

import UIKit
import SafariServices

struct AdvertisementCollectionViewCellSelectionCommand: Command {

    private let advertisement: Advertisement
    private weak var viewController: UIViewController?

    init(advertisement: Advertisement, viewController: UIViewController?) {
        self.advertisement = advertisement
        self.viewController = viewController
    }

    func perform(arguments: [CommandArgumentKey: Any]?) {
        let safariViewController = SFSafariViewController(url: advertisement.clickthroughUrl)
        safariViewController.dismissButtonStyle = .close
        viewController?.present(safariViewController, animated: true, completion: nil)
    }
}
