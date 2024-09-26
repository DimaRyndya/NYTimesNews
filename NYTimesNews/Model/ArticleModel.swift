import Foundation

struct ArticleModel: Decodable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let publishedDate: String
    let author: String
    var imageURL: String?

    enum CodingKeys: String, CodingKey {
        case id, title
        case description = "abstract"
        case publishedDate = "published_date"
        case author = "byline"
        case media
    }

    init(id: Int, title: String, description: String, publishedDate: String, author: String, imageURL: String? = nil) {
        self.id = id
        self.title = title
        self.description = description
        self.publishedDate = publishedDate
        self.author = author
        self.imageURL = imageURL
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
        publishedDate = try container.decode(String.self, forKey: .publishedDate)
        author = try container.decode(String.self, forKey: .author)

        if let mediaArray = try? container.decode([Media].self, forKey: .media),
           let firstMedia = mediaArray.first,
           let largeImageURL = firstMedia.mediaMetadata.last {
            imageURL = largeImageURL.url
        } else {
            imageURL = nil
        }
    }
}

