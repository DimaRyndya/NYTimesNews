import Foundation

struct ArticleModel: Decodable, Identifiable {
    let id: Int
    let title: String
    let description: String

    enum CodingKeys: String, CodingKey {
        case id, title
        case description = "abstract"
    }
}

