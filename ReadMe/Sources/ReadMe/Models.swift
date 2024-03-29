//
//  Models.swift
//  
//
//  Created by Tiago Henriques on 26/12/2022.
//

import Foundation

struct Post: Encodable, Decodable {
    let id: Int
    let name: String
    let summary: String
    let publishedAt: String
    let postUrl: String
    var githubUrl: String?
}

extension Post {
    var markdown: String { "* [\(name)](\(postUrl))" }
}
