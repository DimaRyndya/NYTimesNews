import Foundation

struct ArticlesRequestResponse: Decodable {
    let articles: [ArticleModel]

    enum CodingKeys: String, CodingKey {
        case articles = "results"
    }
}

struct Media: Decodable {
    let mediaMetadata: [MediaMetadata]

    enum CodingKeys: String, CodingKey {
        case mediaMetadata = "media-metadata"
    }
}

struct MediaMetadata: Decodable {
    let url: String
}
