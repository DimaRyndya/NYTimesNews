import SwiftUI

@main
struct NewsApp: App {

    @StateObject private var viewModel = ArticlesViewModel()

    var body: some Scene {
        WindowGroup {
            TabView {
                ArticlesView(viewModel: viewModel, articleType: .emailed)
                    .tabItem {
                        Label("Most Emailed", systemImage: "envelope.arrow.triangle.branch.fill")
                    }

                ArticlesView(viewModel: viewModel, articleType: .shared)
                    .tabItem {
                        Label("Most Shared", systemImage: "square.and.arrow.up.fill")
                    }

                ArticlesView(viewModel: viewModel, articleType: .viewed)
                    .tabItem {
                        Label("Most Viewed", systemImage: "eye.fill")
                    }
            }
        }
    }
}

