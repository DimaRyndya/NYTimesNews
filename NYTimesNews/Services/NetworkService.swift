import Foundation
import SwiftUI
import Alamofire
import Combine

final class NetworkService {

    // MARK: - Generic for fetching data from URL
    func fetchData<T: Decodable>(from url: String, parameters: [String: Any]) -> AnyPublisher<T, AFError> {
        return AF.request(url, parameters: parameters)
            .validate()
            .publishDecodable(type: T.self)
            .value()
            .eraseToAnyPublisher()
    }
}
