
import Foundation
import NetworkCore
import AppstoreAPI

// MARK: - Live
public extension APIClient {
    static let live = Self(
        reviewList: { completion in
            DispatchQueue.global().async {
                requestLoader.load(request: .reviewList) { result in
                    DispatchQueue.main.async {
                        completion(
                            result
                                .map { $0.reviews }
                                .mapError(convertError)
                        )
                    }
                }
            }
        }
    )
}

// MARK: - Headers
private let requestLoader = RequestLoader(
    baseURL: URL(string: "https://itunes.apple.com/")!,
    standardHeaders: [:]
)

// MARK: - Error Mapping
private func convertError(_ error: Error) -> APIError {
    if let appStoreApiError = error as? APIError {
        return appStoreApiError
    }
    if let networkError = error as? NetworkError {
        switch networkError {
        case .noConnection:
            return .noConnection
        case .url(let error):
            return .url(error)
        }
    }
    return .unknown
}
