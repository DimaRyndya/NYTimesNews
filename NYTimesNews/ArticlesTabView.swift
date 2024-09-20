import SwiftUI

struct ArticlesTabView: View {

    @StateObject private var viewModel = ArticlesViewModel()

    var body: some View {
        TabView {
            ArticlesView(articles: viewModel.emailedArticles)
                .tabItem {
                    Label("Most Emailed", systemImage: "envelope.arrow.triangle.branch.fill")
                }
                .onAppear {
                    if viewModel.emailedArticles.isEmpty {
                        viewModel.loadArticles(for: .emailed)
                    }
                }
            ArticlesView(articles: viewModel.viewedArticles)
                .tabItem {
                    Label("Most Shared", systemImage: "square.and.arrow.up.fill")
                }
                .onAppear {
                    if viewModel.viewedArticles.isEmpty {
                        viewModel.loadArticles(for: .viewed)
                    }
                }
            ArticlesView(articles: viewModel.sharedArticles)
                .tabItem {
                    Label("Most Viewed", systemImage: "eye.fill")
                }
                .onAppear {
                    if viewModel.sharedArticles.isEmpty {
                        viewModel.loadArticles(for: .shared)
                    }
                }
        }
    }
}

#Preview {
    ArticlesTabView()
}
