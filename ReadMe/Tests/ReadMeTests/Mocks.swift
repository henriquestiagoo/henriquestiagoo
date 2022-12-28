//
//  Mocks.swift
//  
//
//  Created by Tiago Henriques on 28/12/2022.
//

import Foundation
@testable import ReadMe

struct Mocks {
    
    static let template: String =
    """
    ### Latest articles in my blog
    {latest_posts}
    """
    
    static let posts = [
        Post(
            id: 0,
            name: "🥕 Carrots",
            summary: "A scalable and easy to use HTTP client written in Swift",
            publishedAt: "2021-03-07",
            postUrl: "https://tiagohenriques.vercel.app/blog/carrots-http-client-swift",
            githubUrl: "https://github.com/henriquestiagoo/Carrots"
        )
    ]
}
