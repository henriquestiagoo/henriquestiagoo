import Foundation
import ArgumentParser

struct ReadMe: AsyncParsableCommand {
    @Argument(help: "The template file that is to be used to parse and replace content.")
    var template: String

    @Argument(help: "The path of the destination README file.")
    var destination: String
    
    // this is the code that will be executed by the command
    mutating func run() async throws {
        guard let url = URL(string: "https://tiagohenriques.vercel.app/api/posts") else { return }

        let urlRequest = URLRequest(url: url)
        var data: Data?
        if #available(macOS 12, *) {
            data = try await URLSession.shared.data(for: urlRequest).0
        } else {
            data = try await URLSession.shared.asyncData(from: urlRequest).0
        }
//        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        guard let data = data else { return }
        let posts = try JSONDecoder.snakeCaseDecoder.decode([Post].self, from: data)
        // get the latest posts
        let latestPosts = (posts.count < 3) ? posts : Array(posts.suffix(3)).reversed()
        // format the model data into a string
        let formattedPosts = MarkdownFormatter.formatPostsToString(latestPosts)
        // read the string from the template file and replace the placeholder with the posts string
        let newContent = try String(contentsOf: URL(fileURLWithPath: template), encoding: .utf8)
            .replacingOccurrences(of: "{latest_posts}", with: formattedPosts)
        // write to the README.md file
        try newContent.write(to: URL(fileURLWithPath: destination), atomically: true, encoding: .utf8)
    }
}

// Invoke the script on the entrypoint `main.swift`
ReadMe.main()
