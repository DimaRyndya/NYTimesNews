import SwiftUI

struct ArticleCellView: View {

    let article: ArticleModel

    var body: some View {
        VStack(alignment: .leading) {
            Text(article.title)
                .font(.headline)
            Text(article.description)
                .font(.subheadline)
                .lineLimit(2)
        }
        .padding(.vertical, 10)
    }
}

#Preview {
    ArticleCellView(article: ArticleModel(id: 1, title: "Hello", description: "Article", publishedDate: "1", author: "22"))
}
