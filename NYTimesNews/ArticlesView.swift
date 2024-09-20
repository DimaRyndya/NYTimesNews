import SwiftUI

struct ArticlesView: View {

    var articles: [ArticleModel]

    var body: some View {
        NavigationView {
            List(articles) { article in
                ArticleCellView(article: article)
            }
            .navigationTitle("News")
        }
    }
}

#Preview {
    ArticlesView(articles: ArticlesViewModel().emailedArticles)
}
