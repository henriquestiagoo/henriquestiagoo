import XCTest
@testable import ReadMe

final class ReadMeTests: XCTestCase {
    let posts = Mocks.posts
    let template = Mocks.template
        
    func testReplaceTemplateStringExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        // format the model data into a string
        let formattedPosts = MarkdownFormatter.formatPostsToString(posts)
        // read the string from the template file and replace the placeholder with the posts string
        let newContent = template.replacingOccurrences(of: "{latest_posts}", with: formattedPosts)
                
        XCTAssertEqual(
            newContent,
            """
            ### Latest articles in my blog
            * [🥕 Carrots](https://tiagohenriques.vercel.app/blog/carrots-http-client-swift)
            """
        )
    }
    
    func testWriteAndReplaceFileExample() throws {
        let testFileURL = FileManager.default.temporaryDirectory.appendingPathComponent("README_test.md")
        try template.data(using: .utf8)!.write(to: testFileURL)

        // format the model data into a string
        let formattedPosts = MarkdownFormatter.formatPostsToString(posts)
        // read the string from the template file and replace the placeholder with the posts string
        let newContent = try String(contentsOf: testFileURL, encoding: .utf8)
            .replacingOccurrences(of: "{latest_posts}", with: formattedPosts)
        try newContent.write(to: testFileURL, atomically: true, encoding: .utf8)
        
        XCTAssertEqual(
            newContent,
            """
            ### Latest articles in my blog
            * [🥕 Carrots](https://tiagohenriques.vercel.app/blog/carrots-http-client-swift)
            """
        )

        // Clean up
        try FileManager.default.removeItem(at: testFileURL)
    }
}
