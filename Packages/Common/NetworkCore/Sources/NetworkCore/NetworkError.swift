
import Foundation

public enum NetworkError: Error {
    case url(Error)
    case noConnection
}
