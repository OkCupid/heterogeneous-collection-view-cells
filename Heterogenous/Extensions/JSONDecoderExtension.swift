//
//  JSONDecoder.swift
//  Heterogenous
//
//  Created by Julian Tejera-Frias on 3/12/18.
//  Copyright © 2018 OkCupid. All rights reserved.
//

import Foundation

enum FixtureError: Error {
    case fileNotFound
}

extension JSONDecoder {

    func decodeFixture<T>(name: String, bundle: Bundle = .main) throws -> T where T: Decodable {
        guard let url = bundle.url(forResource: name, withExtension: "json") else {
            throw FixtureError.fileNotFound
        }

        let data = try Data(contentsOf: url)
        return try decode(T.self, from: data)
    }

}
