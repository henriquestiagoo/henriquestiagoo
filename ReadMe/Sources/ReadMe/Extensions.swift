//
//  Extensions.swift
//  
//
//  Created by Tiago Henriques on 26/12/2022.
//

import Foundation

public extension JSONDecoder {
    static let snakeCaseDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
}
