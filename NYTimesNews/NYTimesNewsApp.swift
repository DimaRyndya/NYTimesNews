import SwiftUI

@main
struct NewsApp: App {

    @StateObject private var viewModel = ArticlesViewModel()

    var body: some Scene {

        WindowGroup {
            TabView {
                ArticlesView(articles: viewModel.mostEmailedArticles)
                    .tabItem {
                        Label("Most Emailed", systemImage: "envelope.arrow.triangle.branch.fill")
                    }
                    .onAppear {
                        viewModel.loadArticles(for: .emailed)
                    }
                ArticlesView(articles: viewModel.mostSharedArticles)
                    .tabItem {
                        Label("Most Shared", systemImage: "square.and.arrow.up.fill")
                    }
                    .onAppear {
                        viewModel.loadArticles(for: .shared)
                    }
                ArticlesView(articles: viewModel.mostViewedArticles)
                    .tabItem {
                        Label("Most Viewed", systemImage: "eye.fill")
                    }
                    .onAppear {
                        viewModel.loadArticles(for: .viewed)
                    }
            }
        }
    }
}
