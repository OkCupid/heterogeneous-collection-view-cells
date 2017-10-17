//
//  URLSessionTaskProtocol.swift
//  Heterogenous
//
//  Created by Julian Tejera-Frias on 10/16/17.
//  Copyright © 2017 OkCupid. All rights reserved.
//

import Foundation

protocol URLSessionTaskProtocol: Cancellable {
    var taskIdentifier: Int { get }
    var state: URLSessionTask.State { get }
}

extension URLSessionTask: URLSessionTaskProtocol {}
