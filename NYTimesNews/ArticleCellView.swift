import SwiftUI

struct ArticleCellView: View {

    let article: ArticleModel

    var body: some View {
        VStack {
            Text(article.title)
                .font(.headline)
            Text(article.description)
                .font(.subheadline)
        }
        .padding(.vertical, 10)
    }
}

#Preview {
    ArticleCellView(article: ArticleModel(id: 1, title: "Hello", description: "Article"))
}
