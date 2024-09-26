import SwiftUI

struct ArticlesView: View {

    var articles: [ArticleModel]

    var body: some View {
        NavigationView {
            List(articles) { article in
                NavigationLink {
                    ArticleDetailView(article: article)
                } label: {
                    ArticleCellView(article: article)
                }
            }
            .navigationTitle("News")
        }
    }
}

#Preview {
    ArticlesView(articles: ArticlesViewModel().emailedArticles)
}
