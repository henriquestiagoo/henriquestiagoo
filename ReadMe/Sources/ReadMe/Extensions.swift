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

@available(macOS, deprecated: 12.0, message: "Use the built-in API instead")
extension URLSession {
    func asyncData(from urlRequest: URLRequest) async throws -> (Data, URLResponse) {
        try await withCheckedThrowingContinuation { continuation in
            let task = self.dataTask(with: urlRequest) { data, response, error in
                guard let data = data, let response = response else {
                    let error = error ?? URLError(.badServerResponse)
                    return continuation.resume(throwing: error)
                }

                continuation.resume(returning: (data, response))
            }
            task.resume()
        }
    }
}
