// MARK: Frameworks

import Foundation

// MARK: Article

struct Articles: Decodable {
    let count: Int
    let results: [Article]
    
    enum CodingKeys: CodingKey, String {
        case count = "num_results"
        case results = "results"
    }
}

// MARK: Article

struct Article: Decodable {
    let articleId: Int
    let title: String
    let url: URL
    
    enum CodingKeys: CodingKey, String {
        case articleId = "id"
        case title = "title"
        case url = "url"
    }
}
