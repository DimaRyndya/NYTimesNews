import SwiftUI

struct ArticlesTabView: View {

    @StateObject private var viewModel = ArticlesViewModel()

    var body: some View {
        TabView {
            ForEach(viewModel.tabs, id: \.self) { tab in
                ArticlesView(articles: viewModel.getArticles(for: tab))
                    .tabItem {
                        switch tab {
                        case .emailed(let title, let image),
                                .viewed(let title, let image),
                                .shared(let title, let image):
                            Label(title, systemImage: image)
                        }
                    }
                    .onAppear {
                        if viewModel.getArticles(for: tab).isEmpty {
                            viewModel.loadArticles(for: tab)
                        }
                    }
                    .refreshable {
                        viewModel.loadArticles(for: tab)
                    }
            }
        }
    }
}

#Preview {
    ArticlesTabView()
}
