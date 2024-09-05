import Foundation
import Alamofire
import Combine

class NetworkService {
    func fetchData<T: Decodable>(from url: String, parameters: [String: Any]) -> AnyPublisher<T, AFError> {
        return AF.request(url, parameters: parameters)
            .validate()
            .publishDecodable(type: T.self)
            .value()
            .eraseToAnyPublisher()
    }
}
