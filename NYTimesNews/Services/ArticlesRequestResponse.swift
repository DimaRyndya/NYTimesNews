import Foundation

struct ArticlesRequestResponse: Decodable {

    let articles: [ArticleModel]

    enum CodingKeys: String, CodingKey {
        case articles = "results"
    }
}
