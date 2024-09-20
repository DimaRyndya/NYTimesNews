import Foundation
import Combine

final class ArticlesViewModel: ObservableObject {

    @Published private(set) var emailedArticles: [ArticleModel] = []
    @Published private(set) var viewedArticles: [ArticleModel] = []
    @Published private(set) var sharedArticles: [ArticleModel] = []

    private let networkService = NetworkService()
    private var cancellables = Set<AnyCancellable>()

    func loadArticles(for type: ArticleType) {
        let apiKey = "i4T2FJirMgYdE6aDvr5oBugtyBtqJff0"
        let parameters = ["api-key" : apiKey]
        var url: String {
            switch type {
            case .emailed:
                return "https://api.nytimes.com/svc/mostpopular/v2/emailed/7.json"
            case .viewed:
                return "https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json"
            case .shared:
                return "https://api.nytimes.com/svc/mostpopular/v2/shared/1/facebook.json"
            }
        }

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
                    self?.emailedArticles = response.articles
                case .viewed:
                    self?.viewedArticles = response.articles
                case .shared:
                    self?.sharedArticles = response.articles
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
