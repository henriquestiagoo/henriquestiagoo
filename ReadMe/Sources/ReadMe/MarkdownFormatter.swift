//
//  MarkdownFormatter.swift
//  
//
//  Created by Tiago Henriques on 26/12/2022.
//

import Foundation

struct MarkdownFormatter {
    static func formatPostsToString(_ posts: [Post]) -> String {
        posts.map { $0.markdown }.joined(separator: "\n")
    }
}
