import SwiftUI

struct ArticlesView: View {

    var articles: [ArticleModel]

    var body: some View {
        NavigationView {
            List {
                ForEach(articles, id: \.id) { article in
                    ArticleCellView(article: article)
                }
            }
            .navigationTitle("Articles")
        }
        Text("Hello")
    }
}

#Preview {
    ArticlesView(articles: [ArticleModel(id: 1, title: "Hello", description: "Article")])
}
