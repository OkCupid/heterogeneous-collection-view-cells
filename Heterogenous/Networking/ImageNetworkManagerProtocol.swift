//
//  ImageNetworkManagerProtocol.swift
//  Heterogenous
//
//  Created by Julian Tejera-Frias on 10/16/17.
//  Copyright © 2017 OkCupid. All rights reserved.
//

import UIKit

protocol ImageNetworkManagerProtocol {
    func request(url: URL, callback: @escaping (UIImage?) -> Void) -> URLSessionTaskProtocol
}
