import Foundation
import Combine

final class ArticlesViewModel: ObservableObject {

    @Published private(set) var mostEmailedArticles: [ArticleModel] = []
    @Published private(set) var mostViewedArticles: [ArticleModel] = []
    @Published private(set) var mostSharedArticles: [ArticleModel] = []

    private let networkService = NetworkService()
    private var cancellables = Set<AnyCancellable>()
    var articleType: ArticleType = .emailed

    func loadArticles(for type: ArticleType) {
        let apiKey = "i4T2FJirMgYdE6aDvr5oBugtyBtqJff0"
        let parameters = ["api-key" : apiKey]
        var url = ""

        switch type {
        case .emailed:
            url = "https://api.nytimes.com/svc/mostpopular/v2/emailed/7.json"
        case .viewed:
            url = "https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json"
        case .shared:
            url = "https://api.nytimes.com/svc/mostpopular/v2/shared/1/facebook.json"
        }

        articleType = type

        networkService.fetchData(from: url, parameters: parameters)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    break
                }
            } receiveValue: { [weak self] (response: ArticlesRequestResponse) in
                switch type {
                case .emailed:
                    self?.mostEmailedArticles = response.articles
                case .viewed:
                    self?.mostViewedArticles = response.articles
                case .shared:
                    self?.mostSharedArticles = response.articles
                }

            }
            .store(in: &cancellables)
    }
}

extension ArticlesViewModel {
    enum ArticleType {
        case emailed
        case viewed
        case shared
    }
}
