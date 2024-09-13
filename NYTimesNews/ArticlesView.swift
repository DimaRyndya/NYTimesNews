import SwiftUI

struct ArticlesView: View {

    @ObservedObject var viewModel: ArticlesViewModel
    var articleType: ArticlesViewModel.ArticleType

    var body: some View {
        NavigationView {
            List(viewModel.articles) { article in
                ArticleCellView(article: article)
            }
            .navigationTitle("Articles")
            .onAppear {
                viewModel.loadArticles(for: articleType)
            }
        }
    }
}

#Preview {
    ArticlesView(viewModel: ArticlesViewModel(), articleType: .emailed)
}
